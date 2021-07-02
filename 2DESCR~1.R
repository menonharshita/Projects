library(ggplot2)
library(psych)
library(lattice)
library(stringr)

setwd("C:\\Users\\abhis\\OneDrive\\Desktop\\Assignments\\Project")

youtube_desc <- read.csv("youtubedata.csv", header = TRUE, sep = ',')

youtube_desc

### CLeaning of the data as the likes and dislikes are missing on some videos

#youtube_desc <- youtube_desc[-c(64,98), ]

#write.csv(youtube_desc, row.names = F, file= "cleanyoutubedata.csv")

youtube_data <- read.csv("cleanyoutubedata.csv", header = TRUE, sep = ',')


#### Descriptive Statistics and Analysis
summary(youtube_data)
sd(youtube_data$Viewcount)
sd(youtube_data$Likes)
sd(youtube_data$Dislikes)
sd(youtube_data$Length_in_sec)


######scatterPlots generated for visualization

plot(youtube_data$Viewcount/1000, youtube_data$Likes/10, col = "red", main = "Scatter Plot of Views vs Likes", xlab = "Views", ylab = "Likes")
plot(youtube_data$Viewcount/1000, youtube_data$Dislikes, col = "red", main = "Scatter Plot of Views vs Dislikes", xlab = "Views", ylab = "Dislikes")
plot(youtube_data$Viewcount/1000, youtube_data$Length_in_sec, col = "red", main = "Scatter Plot of Views vs Length of video in seconds", xlab = "Views", ylab = "Length in seconds")


#####Classification model####

df <- read.table('cleanyoutubedata.csv', 
                 header = TRUE, sep = ',')

VideoId <- df$VideoId
Title <- df$Title
Uploader <- df$Uploader
PublishedDateTime  <- df$PublishedDateTime
Viewcount <- df$Viewcount
Likes <- df$Likes
Dislikes <- df$Dislikes
Length_in_sec <- df$Length_in_sec
Duration <- df$Duration

## Classification model was created
hit_video = df$Likes >= 10000
logimod1 <- glm(hit_video ~ Viewcount + Length_in_sec, data = df, family = "binomial")
summary(logimod1)











