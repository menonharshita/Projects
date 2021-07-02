library(tm)
library(tidyverse)
library(tidytext)
library(SnowballC)
library(wordcloud)
library(udpipe)
library(lattice)
library(ggplot2)
setwd("C:\\Users\\abhis\\OneDrive\\Desktop\\Assignments\\Project")
##############################################################################
## Cleaning comments and renaming the column names
### The clean data is already provided in the VM so here just reading of the CSV file is required

#youtube_com <- read.csv("youtubecommentdata1.csv", header = TRUE, sep = ',')

#youtube_com = youtube_com %>%
#  rename(Comments1 = X0)

#write.csv(youtube_com, row.names = F, file = 'Comments1.csv')

youtube_com1 <- read.csv("Comments1.csv", header = TRUE, sep = ',')

############

#youtube_com <- read.csv("youtubecommentdata2.csv", header = TRUE, sep = ',')

#youtube_com = youtube_com %>%
#  rename(Comments2 = X0)

#write.csv(youtube_com, row.names = F, file = 'Comments2.csv')

youtube_com2 <- read.csv("Comments2.csv", header = TRUE, sep = ',')

##############

#youtube_com <- read.csv("youtubecommentdata3.csv", header = TRUE, sep = ',')

#youtube_com = youtube_com %>%
#  rename(Comments3 = X0)

#write.csv(youtube_com, row.names = F, file = 'Comments3.csv')

youtube_com3 <- read.csv("Comments3.csv", header = TRUE, sep = ',')

####################3
#youtube_com <- read.csv("youtubecommentdata4.csv", header = TRUE, sep = ',')

#youtube_com = youtube_com %>%
#  rename(Comments4 = X0)

#write.csv(youtube_com, row.names = F, file = 'Comments4.csv')

youtube_com4 <- read.csv("Comments4.csv", header = TRUE, sep = ',')


##################

#youtube_com <- read.csv("youtubecommentdata5.csv", header = TRUE, sep = ',')


#youtube_com = youtube_com %>%
#  rename(Comments5 = X0)

#write.csv(youtube_com, row.names = F, file = 'Comments5.csv')

youtube_com5 <- read.csv("Comments5.csv", header = TRUE, sep = ',')

######################################



########################## Text mining ##########################################################


pattern = "[0-9].?:.?[0-9]+"

youtube_com1$Comments1 = str_replace(youtube_com1$Comments1, pattern,'') 

youtube_com1$Comments1 = as.character(youtube_com1$Comments1)

## Tokenizing
cdata1 = youtube_com1 %>%
  
  unnest_tokens(word, Comments1)

cdata1 %>%
  count(word) %>%
  arrange(desc(n))
# Removing stop words

data("stop_words")

cdat1 = cdata1 %>%
  anti_join(stop_words)

cdat1 %>%
  count(word) %>%
  
  arrange(desc(n))

### Remove pattern digits and numerical values
patterndigits = '\\b[0-9]+\\b'
paten = 'ря'
cdat1$word = str_remove_all(cdat1$word, paten)
cdat1$word = cdat1$word %>%
  str_replace_all(patterndigits, '')

## Remove new lines 

cdat1$word = cdat1$word %>%
  str_replace_all('\\n', '')
cdat1$word

## Remove tabs and spaces 

cdat1$word = cdat1$word %>%
  str_replace_all('[:blank:]','')
cdat1$word


cda1 = cdat1 %>%
  filter(!(word==''))

cda1 %>%
  count(word) %>%
  arrange(desc(n))

## Filtering out the useless words

list = c("в","п", "щ")

cd1 = cda1 %>%
  filter(!(word %in% list))

## Stem the words 
c1 = cd1 %>%
  mutate_at("word", funs(wordStem((.), language = "en")))

c1 %>%
  count(word) %>%
  arrange(desc(n))


######################################333
#2222222222222222222222222######################### Text mining ##########################################################


pattern = "[0-9].?:.?[0-9]+"

youtube_com2$Comments2 = str_replace(youtube_com2$Comments2, pattern,'') 

youtube_com2$Comments2 = as.character(youtube_com2$Comments2)

## Tokenizing
cdata2 = youtube_com2 %>%
  
  unnest_tokens(word, Comments2)

cdata2 %>%
  count(word) %>%
  arrange(desc(n))
# Removing stop words

data("stop_words")

cdat2 = cdata2 %>%
  anti_join(stop_words)

cdat2 %>%
  count(word) %>%
  
  arrange(desc(n))

### Remove pattern digits and numerical values
patterndigits = '\\b[0-9]+\\b'
paten = 'ря'
cdat2$word = str_remove_all(cdat2$word, paten)
cdat2$word = cdat2$word %>%
  str_replace_all(patterndigits, '')

## Remove new lines 

cdat2$word = cdat2$word %>%
  str_replace_all('\\n', '')
cdat2$word

## Remove tabs and spaces 

cdat2$word = cdat2$word %>%
  str_replace_all('[:blank:]','')
cdat2$word


cda2 = cdat2 %>%
  filter(!(word==''))

cda2 %>%
  count(word) %>%
  arrange(desc(n))

## Filtering out the useless words

list = c("'µ")

cd2 = cda2 %>%
  filter(!(word %in% list))

## Stem the words 
c2 = cd2 %>%
  mutate_at("word", funs(wordStem((.), language = "en")))

c2 %>%
  count(word) %>%
  arrange(desc(n))

########################################################################

#############333333############# Text mining ##########################################################


pattern = "[0-9].?:.?[0-9]+"

youtube_com3$Comments3 = str_replace(youtube_com3$Comments3, pattern,'') 

youtube_com3$Comments3 = as.character(youtube_com3$Comments3)

## Tokenizing
cdata3 = youtube_com3 %>%
  
  unnest_tokens(word, Comments3)

cdata3 %>%
  count(word) %>%
  arrange(desc(n))
# Removing stop words

data("stop_words")

cdat3 = cdata3 %>%
  anti_join(stop_words)

cdat3 %>%
  count(word) %>%
  
  arrange(desc(n))

### Remove pattern digits and numerical values
patterndigits = '\\b[0-9]+\\b'
paten = 'ря'
cdat3$word = str_remove_all(cdat3$word, paten)
cdat3$word = cdat3$word %>%
  str_replace_all(patterndigits, '')

## Remove new lines 

cdat3$word = cdat3$word %>%
  str_replace_all('\\n', '')
cdat3$word

## Remove tabs and spaces 

cdat3$word = cdat3$word %>%
  str_replace_all('[:blank:]','')
cdat3$word


cda3 = cdat3 %>%
  filter(!(word==''))

cda3 %>%
  count(word) %>%
  arrange(desc(n))

## Filtering out the useless words

list = c("в","п")

cd3 = cda3 %>%
  filter(!(word %in% list))

## Stem the words 
c3 = cd3 %>%
  mutate_at("word", funs(wordStem((.), language = "en")))

c3 %>%
  count(word) %>%
  arrange(desc(n))

############################################################################

########################## Text mining ##########################################################


pattern = "[0-9].?:.?[0-9]+"

youtube_com4$Comments4 = str_replace(youtube_com4$Comments4, pattern,'') 

youtube_com4$Comments4 = as.character(youtube_com4$Comments4)

## Tokenizing
cdata4 = youtube_com4 %>%
  
  unnest_tokens(word, Comments4)

cdata4 %>%
  count(word) %>%
  arrange(desc(n))
# Removing stop words

data("stop_words")

cdat4 = cdata4 %>%
  anti_join(stop_words)

cdat4 %>%
  count(word) %>%
  
  arrange(desc(n))

### Remove pattern digits and numerical values
patterndigits = '\\b[0-9]+\\b'
paten = 'ря'
cdat4$word = str_remove_all(cdat4$word, paten)
cdat4$word = cdat4$word %>%
  str_replace_all(patterndigits, '')

## Remove new lines 

cdat4$word = cdat4$word %>%
  str_replace_all('\\n', '')
cdat4$word

## Remove tabs and spaces 

cdat4$word = cdat4$word %>%
  str_replace_all('[:blank:]','')
cdat4$word


cda4 = cdat4 %>%
  filter(!(word==''))

cda4 %>%
  count(word) %>%
  arrange(desc(n))


## Stem the words 
cd4 = cda4 %>%
  mutate_at("word", funs(wordStem((.), language = "en")))

cd4 %>%
  count(word) %>%
  arrange(desc(n))

###########################################################################

########################## Text mining ##########################################################


pattern = "[0-9].?:.?[0-9]+"

youtube_com5$Comments5 = str_replace(youtube_com5$Comments5, pattern,'') 

youtube_com5$Comments5 = as.character(youtube_com5$Comments5)

## Tokenizing
cdata5 = youtube_com5 %>%
  
  unnest_tokens(word, Comments5)

cdata5 %>%
  count(word) %>%
  arrange(desc(n))
# Removing stop words

data("stop_words")

cdat5 = cdata5 %>%
  anti_join(stop_words)

cdat5 %>%
  count(word) %>%
  
  arrange(desc(n))

### Remove pattern digits and numerical values
patterndigits = '\\b[0-9]+\\b'
paten = 'ря'
cdat5$word = str_remove_all(cdat5$word, paten)
cdat5$word = cdat5$word %>%
  str_replace_all(patterndigits, '')

## Remove new lines 

cdat5$word = cdat5$word %>%
  str_replace_all('\\n', '')
cdat5$word

## Remove tabs and spaces 

cdat5$word = cdat5$word %>%
  str_replace_all('[:blank:]','')
cdat5$word


cda5 = cdat5 %>%
  filter(!(word==''))

cda5 %>%
  count(word) %>%
  arrange(desc(n))

## Filtering out the useless words

list = c("в","п")

cd5 = cda5 %>%
  filter(!(word %in% list))

## Stem the words 
c5 = cd5 %>%
  mutate_at("word", funs(wordStem((.), language = "en")))

c5 %>%
  count(word) %>%
  arrange(desc(n))

############################################################################

##########################################Sentiment Analysis#########################################

#######################1111111111111111111 trust fear

nrc_tf = get_sentiments('nrc') %>%
  
  filter(sentiment == 'trust' |
           
           sentiment == 'fear')

nrow(nrc_tf)

(sentiment1 = cd1 %>%
    
    inner_join(nrc_tf) %>%
    
    count(word, sentiment) %>%
    
    spread(sentiment, n, fill = 0) %>%
    
    mutate(trustworthy = trust - fear, linenumber = row_number()) %>%
    
    arrange(desc(trustworthy)))

## Plot for surprise and disgust

(senti1 = sentiment1 %>%
    slice(1:462))
   

ggplot(senti1, aes(x=linenumber, y=trustworthy, fill=word)) +
  
  coord_flip() +
  
  theme_classic(base_size = 15) +
  
  labs(
    
    x='Index Value',
    
    y='Trustworthy'
    
  ) +
  
  theme(
    
    legend.position = 'right',
    
    panel.grid = element_blank(),
    
    axis.title = element_text(size = 14),
    
    axis.text.x = element_text(size = 14),
    
    axis.text.y = element_text(size = 14)
    
  ) +
  
  geom_col()





##################22222222222222222 disgust vs Surprise

nrc_ds = get_sentiments('nrc') %>%
  
  filter(sentiment == 'disgust' |
           
           sentiment == 'surprise')

nrow(nrc_ds)

(sentiment2 = cd2 %>%
    
    inner_join(nrc_ds) %>%
    
    count(word, sentiment) %>%
    
    spread(sentiment, n, fill = 0) %>%
    
    mutate(reaction = surprise - disgust, linenumber = row_number()) %>%
    
    arrange(desc(reaction)))

## Plot for surprise and disgust

(senti2 = sentiment2 %>%
    
    slice(1:500))

ggplot(senti2, aes(x=linenumber, y=reaction, fill=word)) +
  
  coord_flip() +
  
  theme_classic(base_size = 15) +
  
  labs(
    
    x='Index Value',
    
    y='Reaction'
    
  ) +
  
  theme(
    
    legend.position = 'right',
    
    panel.grid = element_blank(),
    
    axis.title = element_text(size = 14),
    
    axis.text.x = element_text(size = 14),
    
    axis.text.y = element_text(size = 14)
    
  ) +
  
  geom_col()

  






#############333333333333  joy and sad

nrc_joysad = get_sentiments('nrc') %>%
  
  filter(sentiment == 'joy' |
           
           sentiment == 'sadness')

nrow(nrc_joysad)

(sentiment3 = cd3 %>%
    
    inner_join(nrc_joysad) %>%
    
    count(word, sentiment) %>%
    
    spread(sentiment, n, fill = 0) %>%
    
    mutate(contentment = joy - sadness, linenumber = row_number()) %>%
    
    arrange(desc(contentment)))


(senti3 = sentiment3 %>%
    
    slice(1:447))
ggplot(senti3, aes(x=linenumber, y=contentment, fill=word)) +
  
  coord_flip() +
  
  theme_classic(base_size = 15) +
  
  labs(
    
    x='Index Value',
    
    y='Contentment'
    
  ) +
  
  theme(
    
    legend.position = 'right',
    
    panel.grid = element_blank(),
    
    axis.title = element_text(size = 12),
    
    axis.text.x = element_text(size = 12),
    
    axis.text.y = element_text(size = 12)
    
  ) +
  
  geom_col()

##########44444444444 positive negative

nrc_posneg = get_sentiments('nrc') %>%
  
  filter(sentiment == 'positive' |
           
           sentiment == 'negative')

nrow(nrc_posneg)

(sentiment4 = cd4 %>%
    
    inner_join(nrc_posneg) %>%
    
    count(word, sentiment) %>%
    
    spread(sentiment, n, fill = 0) %>%
    
    mutate(hopeful = positive - negative, linenumber = row_number()) %>%
    
    arrange(desc(hopeful)))


(senti4 = sentiment4 %>%
    
    slice(1:465))

ggplot(senti4, aes(x=linenumber, y=hopeful, fill=word)) +
  
  coord_flip() +
  
  theme_light(base_size = 15) +
  
  labs(
    
    x='Index Value',
    
    y='Hopeful'
    
  ) +
  
  theme(
    
    legend.position = 'right',
    
    panel.grid = element_blank(),
    
    axis.title = element_text(size = 14),
    
    axis.text.x = element_text(size = 14),
    
    axis.text.y = element_text(size = 14)
    
  ) +
  
  geom_col()

#$######$#$#$#$#$################$#$#$#$#$#$#$###################$#$#$##$#$#$#$#$#$












