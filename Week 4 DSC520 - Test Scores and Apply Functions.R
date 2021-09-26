# Assignment: Test Scores Week 4
# Name: Colin Michael
# Date: 2021-09-25


# The observation units of study are the two classes, which are the "sports" class and the "regular" class.
# The variables are the type of curriculum (Sports or Regular), which is categorical, and the Scores, which are quantitative.
# Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section:

library(ggplot2)
theme_set(theme_minimal())

setwd("/Users/colinmichael/Desktop/Data Science/DSC520")

scores_df <- read.csv("scores.csv")

scores_df

scores.sub.sports <- subset(scores_df, Section == "Sports")
scores.sub.sports

scores.sub.regular <- subset(scores_df, Section == "Regular")
scores.sub.regular

scores.sports.plot<- ggplot(scores.sub.sports, aes(x=Score, y=Count)) + geom_point() + ggtitle("Sports Class: Score Distribution") + xlab("Scores of Students") + ylab("Number of Students")
scores.sports.plot 

scores.regular.plot<- ggplot(scores.sub.regular, aes(x=Score, y=Count)) + geom_point() + ggtitle("Regular Class: Score Distribution") + xlab("Scores of Students") + ylab("Number of Students")
scores.regular.plot 

scores.all.plot<- ggplot(scores_df, aes(x=Score, y=Count, col = Section)) + geom_point() + ggtitle("All Class: Score Distribution") + xlab("Scores of Students") + ylab("Number of Students")
scores.all.plot 

#A.)Students in the Regular curriculum tended to score higher than the students in the Sports curriculum. There are higher counts of students in the Regular class with better scores than those in the Sports class.
#B.)Every student in the Regular curriculum did not score higher than every student in the Sports curriculum. The Sports curriculum had the students with the lowest and highest overall scores, whereas the Regular class is more concentrated near the median.
# The Sports section has greater variability. The standard deviation in the Sports curriculum is higher than the Regular group.
#C.) One variable not mentioned could be the times and cadence the classes met. It would be interesting to see how class scheduling impacts test scores.
# For example, would classes starting at 8 am lead to lower test scores than classes at noon time, 2 p.m., 6 p.m., etc.
#install.packages("readxl")
#library ("readxl")
#housing_df <- read_excel("week-7-housing.xlsx")

#housing_df


apply(scores_df[1:2], 2, sum)

aggregate(scores_df$Score, by=list(scores_df$Section), FUN = median )

#install.packages("plyr")
library("plyr")

breakdown<- ddply(scores_df, .(Section, Count), summarize,
      mean = round(mean(Score), 2),
      sd = round(sd(Score), 2))
breakdown

summary(scores_df)

#Outlier is a value 1.5 x IQR
#Count IQR = 10, Score IQR = 57.5,
#No outliers in Count (all values within 15 of 1st and 3rd Quartiles
#No outliers in Score (all values within 86.25 of 1st and 3rd Quartiles

scores_df$totpoints <- scores_df$Count * scores_df$Score
scores_df$percentage <- scores_df$Score / 500

scores_df
