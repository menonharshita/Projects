import pafy
import pandas as pd
import numpy
import regex
from selenium import webdriver
import time
import requests
from bs4 import BeautifulSoup as bs
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import re
import csv


######################### Getting all the links to the videos #########################################
options = webdriver.ChromeOptions()
options.add_argument("start-maximized")
options.add_argument("disable-infobars")
options.add_argument("--disable-extensions")
driver=webdriver.Chrome(chrome_options=options, executable_path=r'C:\\Users\\abhis\\OneDrive\\Desktop\\Assignments\\chromedriver.exe')
driver.get("https://www.youtube.com/")
WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input#search"))).send_keys("Viral Videos")
driver.find_element_by_css_selector("button.style-scope.ytd-searchbox#search-icon-legacy").click()
links = ([my_href.get_attribute("href") for my_href in WebDriverWait(driver, 5).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, "a.yt-simple-endpoint.style-scope.ytd-video-renderer#video-title")))])
long = len(links)
links = links[:-70]
long = len(links)
link_data = pd.DataFrame(links)
link_data = link_data[:-30]
link_data.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubelinksdata.csv')

## Putting all the data into the dataframe and saving it to a csv file#############################################################

linku = []
id = []
name = []
count = []
like = []
dislike = []
lent = []
dur = []
aut = []
pub = []

## using Pafy to get the required data ##

for i in range(long):
    url = links[i]
    v = pafy.new(url, gdata = True)
    video_id = v.videoid
    id.append(video_id)
    v_title = v.title
    name.append(v_title)
    views = v.viewcount
    count.append(views)
    likes = v.likes
    like.append(likes)
    dislikes = v.dislikes
    dislike.append(dislikes)
    v_length = v.length
    lent.append(v_length)
    v_duration = v.duration
    dur.append(v_duration)
    v_author = v.author
    aut.append(v_author)
    v_published = v.published
    pub.append(v_published)

### Please wait for  a while after executing the for loop

## Creating the DataFrame##############################################################################

list = {'VideoId':id, 'Title':name, 'Uploader':aut, 'PublishedDateTime':pub, 'Viewcount':count, 'Likes':like, 'Dislikes': dislike, 'Length_in_sec': lent, 'Duration': dur}
youtube_data = pd.DataFrame(list)
youtube_data.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubedata.csv')

youtube_data.describe()



## To get the comments of the 5 video data that we have selected###############################################################

driver = webdriver.Chrome('C:\\Users\\abhis\\OneDrive\\Desktop\\Assignments\\chromedriver.exe')

comlink = ['https://www.youtube.com/watch?v=nTWnU-AcoOE','https://www.youtube.com/watch?v=mq7yszUJKAs','https://www.youtube.com/watch?v=NC__B8j_Tk8','https://www.youtube.com/watch?v=5ZSnOHD8omM','https://www.youtube.com/watch?v=0GUT3Egdd5k']

## Video 1 comments

linker = comlink[0]
driver.get(linker)
driver.execute_script('window.scrollTo(1, 100000);')
#now wait let load the comments########################################################################
time.sleep(20)
driver.execute_script('window.scrollTo(1, 30000);')
comment_div=driver.find_element_by_xpath('//*[@id="contents"]')
comments0 = comment_div.find_elements_by_xpath('//*[@id="content-text"]')

come = []
for y in comments0:
    come.append(y.text)
comment_data1 = pd.DataFrame(come)
comment_data1.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubecommentdata1.csv')


## Video 2 Comments

linker = comlink[1]
driver.get(linker)
driver.execute_script('window.scrollTo(1, 100000);')
#now wait let load the comments########################################################################
time.sleep(20)
driver.execute_script('window.scrollTo(1, 30000);')
comment_div=driver.find_element_by_xpath('//*[@id="contents"]')
comments1 = comment_div.find_elements_by_xpath('//*[@id="content-text"]')

come1 = []
for y in comments1:
    come1.append(y.text)


comment_data2 = pd.DataFrame(come1)
comment_data2.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubecommentdata2.csv')

## Video 3 Comments 

linker = comlink[2]
driver.get(linker)
driver.execute_script('window.scrollTo(1, 100000);')
#now wait let load the comments########################################################################
time.sleep(20)
driver.execute_script('window.scrollTo(1, 30000);')
comment_div=driver.find_element_by_xpath('//*[@id="contents"]')
comments2 = comment_div.find_elements_by_xpath('//*[@id="content-text"]')

come2 = []
for y in comments2:
    come2.append(y.text)

comment_data3 = pd.DataFrame(come2)
comment_data3.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubecommentdata3.csv')

## Video 4 Comments

linker = comlink[3]
driver.get(linker)
driver.execute_script('window.scrollTo(1, 200000);')
#now wait let load the comments########################################################################
time.sleep(20)
driver.execute_script('window.scrollTo(1, 30000);')
comment_div=driver.find_element_by_xpath('//*[@id="contents"]')
comments3 = comment_div.find_elements_by_xpath('//*[@id="content-text"]')

come3 = []
for y in comments3:
    come3.append(y.text)


comment_data4 = pd.DataFrame(come3)
comment_data4.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubecommentdata4.csv')



## Video 5 Comments

linker = comlink[4]
driver.get(linker)
driver.execute_script('window.scrollTo(1, 200000);')
#now wait let load the comments########################################################################
time.sleep(20)
driver.execute_script('window.scrollTo(1, 30000);')
comment_div=driver.find_element_by_xpath('//*[@id="contents"]')
comments4 = comment_div.find_elements_by_xpath('//*[@id="content-text"]')

come4 = []
for y in comments4:
    come4.append(y.text)


comment_data5 = pd.DataFrame(come4)
comment_data5.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Assignments\Project\youtubecommentdata5.csv')

########################################################################################################

