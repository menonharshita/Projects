import pafy
import youtube_dl
import pandas as pd
import numpy
import regex
from selenium import webdriver
import time
import requests
from lxml import html
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
driver=webdriver.Chrome(chrome_options=options, executable_path=r'C:\\Users\\abhis\\OneDrive\\Desktop\\Semester 1\\Project\\chromedriver.exe')
driver.get("https://www.youtube.com/")
WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input#search"))).send_keys("viral videos")
driver.find_element_by_css_selector("button.style-scope.ytd-searchbox#search-icon-legacy").click()
links = ([my_href.get_attribute("href") for my_href in WebDriverWait(driver, 5).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, "a.yt-simple-endpoint.style-scope.ytd-video-renderer#video-title")))])
long = len(links)
links = links[:-2]
long = len(id)
link_data = pd.DataFrame(links)
link_data = link_data[:-25]
link_data.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Semester 2\MSIS 5223\Project\youtubelinksdata.csv')

## Putting all the data into the dataframe and saving it to a csv file#############################################################


id = []
name = []
count = []
like = []
dislike = []
lent = []
dur = []
aut = []
categ = []
no_of_comments = []


## using Pafy to get the required data ##

for i in range(1,134):
    url = links[i]
    v = pafy.new(url)
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
 
 ### Scraping the number of comments using xpath
for i in range(1,134):
    url = link_data[i]
    pageContent = requests.get(url)
    tree = html.fromstring(pageContent.content)
    com = tree.xpath('//*[@id="count"]/yt-formatted-string')
    no_of_comments = no_of_comments.append(com)

###cleaning the no_of_comments list using regular expression   
no_of_comments = re.findall(r'\d+', no_of_comments)

### Please wait for  a while after executing the for loop

## Creating the DataFrame##############################################################################

list = {'VideoId':id, 'Title':name, 'Uploader':aut, 'PublishedDateTime':pub, 
        'Viewcount':count, 'Likes':like, 'Dislikes': dislike, 'Length_in_sec': lent,
       'Duration': dur, 'Category': categ, 'NoofComments': no_of_comments}
youtube_data = pd.DataFrame(list)
youtube_data.to_csv(r'C:\Users\abhis\OneDrive\Desktop\Semester 2\MSIS 5223\Project\youdata.csv')

youdata.describe()


