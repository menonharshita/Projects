import pandas as pd
import numpy as np
import os
import requests
import nltk
from nltk.stem import PorterStemmer
#nltk.download('punkt')
#nltk.download('averaged_perceptron_tagger')
#nltk.download('maxent_ne_chunker')
#nltk.download('words')

from nltk import word_tokenize, pos_tag, ne_chunk
from nltk.chunk import conlltags2tree, tree2conlltags
from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator
import matplotlib.pyplot as plt
from PIL import Image
os.chdir('C:\\Users\\abhis\\OneDrive\\Desktop\\Assignments\\Project')



#### #### #### Combining all the comments for a better NER #### #### #### #### 
### This is performed on the comments data

df1 = pd.read_csv('Comments1.csv')
df2 = pd.read_csv('Comments2.csv')
df3 = pd.read_csv('Comments3.csv')
df4 = pd.read_csv('Comments4.csv')
df5 = pd.read_csv('Comments5.csv')
textbank1 = str(df1.Comments1)
textbank2 = str(df2.Comments2)
textbank3 = str(df3.Comments3)
textbank4 = str(df4.Comments4)
textbank5 = str(df5.Comments5)

textbank = textbank1 + textbank2 + textbank3 + textbank4 + textbank5


## POS tags for Adjectves and verbs 

post1 = pos_tag(word_tokenize(textbank))
print(post1)

tree1 = ne_chunk(post1)
print(tree1)


adj = []
verbs = []


for x in str(tree1).split('\n'):
    if '/JJ' in x or '/JJR' in x or '/JJS' in x:
        adj.append(x)
    elif '/VB' in x or '/VBD' in x or '/VBG' in x or '/VBN' in x or '/VBP' in x or '/VBP' in x:
        verbs.append(x)





adj
verbs





##WORDCLOUDS for adjectives and verbs 


## adjective
adjective = str(adj)
regg = "JJ"
adjective = adjective.replace(regg, '')
reg2 = 'n5'
adjective = adjective.replace(reg2, '')
reg3 = 'GPE'
adjective = adjective.replace(reg3,'')
reg4 = "R'"
adjective= adjective.replace(reg4, '')
reg5 = "S'"
adjective= adjective.replace(reg5, '')
adjcloud = WordCloud(background_color = 'white').generate(adjective)
plt.imshow(adjcloud, interpolation = 'bilinear')
plt.axis("off")
plt.show()

##verb 
verb = str(verbs)
reg6 = "VBZ"
verb = verb.replace(reg6,'')
reg7 = "VBD'"
verb= verb.replace(reg7, '')
reg7 = "VB'"
verb= verb.replace(reg7, '')
reg7 = "VBP"
verb= verb.replace(reg7, '')
reg7 = "VBN'"
verb= verb.replace(reg7, '')
reg8 = "VBG'"
verb= verb.replace(reg8, '')

verbcloud = WordCloud(background_color = 'white').generate(verb)
plt.imshow(verbcloud, interpolation = 'bilinear')
plt.axis("off")
plt.show()

