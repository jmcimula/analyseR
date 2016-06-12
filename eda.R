#Understanding the analysis of David Robinson

#How to replace a Pie chart

#Loading libraries
library(readr)
library(tidyr)
library(ggplot2)
library(dplyr)
library(ggthemes)


#Data
dsource <- read_csv("Task,< 1 a week,1-4 a week,1-3 a day,>4 a day
Basic exploratory data analysis,11,32,46,12
Data cleaning,19,42,31,7
Machine learning/statistics,34,29,27,10
Creating visualizations,23,41,29,7
Presenting analysis,27,47,20,6
Extract/transform/load,43,32,20,5")

#Reorganise data
dsource <- gather(dsource, Hours, Percentage, -Task)

#Visualize the data organised
View(dsource)

#Bar plot
theme_set(theme_bw())
ggplot(dsource, aes(Hours, Percentage)) + geom_bar(stat = "identity") + facet_wrap(~Task)

#Alternative plots
ggplot(dsource, aes(Hours, Percentage, color = Task, group = Task)) + geom_line()

#Alternative plots based on the percentage of all factors per variable
ggplot(dsource, aes(Hours, Task, fill = Percentage)) + geom_tile(show.legend = FALSE) + geom_text(aes(label = paste0(Percentage, "%")), color = "white")

#Bar plots improved
ggplot(dsource, aes(Hours, Percentage)) + geom_bar(stat = "identity") + facet_wrap(~Task) + theme(axis.text.x = element_text(angle = 90,  hjust = 1))

#Bar plots improved and labeled with the percentage
ggplot(dsource, aes(Hours, Percentage)) + geom_bar(stat = "identity") + facet_wrap(~Task) + geom_text(aes(label = paste0(Percentage, "%"), y = Percentage),vjust = 1.4, size = 5, color = "white")
#In relation of the plot above, Data cleaning is very important 7% of data scientists spend more than 4 hours on it

#Below : Hours spent per week
dsource %>%
  mutate(Task = reorder(Task, Percentage, function(e) e[1])) %>%
  ggplot(aes(Hours, Percentage)) + geom_bar(stat = "identity") +  facet_wrap(~Task) + 
  geom_text(aes(label = paste0(Percentage, "%"), y = Percentage), vjust = 1.4, size = 5, color = "white") +
  theme(axis.text.x = element_text(angle = 90,  hjust = 1)) +
  xlab("Hours spent per week")

#Stacked bar plot
dsource %>%
 mutate(Hours = factor(Hours, levels = unique(dsource$Hours))) %>%
 ggplot(aes(x=Task,y=Percentage)) + geom_bar(stat="identity", position="stack", aes(fill=Hours)) +
 coord_flip() +  scale_fill_brewer(palette="YlGnBu") +  theme_minimal() + theme(legend.position="bottom")

 