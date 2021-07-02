library(psych)
library(ggplot2)
library(Hmisc)	
library(car)
library(nnet)

setwd("C:\\Users\\abhis\\OneDrive\\Desktop\\Semester 2\\MSIS 5223\\Project")
you_data = read.csv("youdata.csv", header = T)
you_data = edit(you_data)

## Subsetting data
you_sub = you_data[c(5,6,7,8,11)]
you_data1 <- you_data[1:80,]
you_data1

## Linearity
plot(you_data$Likes, you_data$Viewcount)
plot(you_data$Dislikes, you_data$Viewcount)
plot(you_data$NoofComments, you_data$Viewcount)
plot(you_data$Length_in_sec, you_data$Viewcount)


#pairs(you_sub, panel = panel.smooth)

## Correlation
cor(you_sub)


## Tolerance and homocedasticity

you_data_reg1 = lm(formula = Viewcount ~ Likes + Dislikes + Length_in_sec + NoofComments, data = you_data1)
summary(you_data_reg1)
vif(you_data_reg1)
plot(you_data_reg1)

## Independence
durbinWatsonTest(you_data_reg1)


###logistic regression
youtubedata2 <- you_data[9:89,]
youtubedata2
you_data_reg2 = glm(Category~Viewcount +Likes + Dislikes + Length_in_sec 
                    + NoofComments, binomial, data = youtubedata2)
summary(you_data_reg2)

#you_data_reg3 = multinom(Category~Viewcount +Likes + Dislikes + Length_in_sec + NoofComments, data = youtubedata2)
#summary(you_data_reg3)

