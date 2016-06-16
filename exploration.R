library(dplyr)
#library(ggplot2)
library(formattable)

#Dataset economics_long

#This dataset was produced from US economic time series data available from http://research.stlouisfed.org/fred2
#PCE : Personal Consumption Expenditures, 
#POP : Total Population, 
#PSAVERT : Personal Savings Rate, 
#UEMPMED: Median Duration of Unemployment, 
#UNEMPLOY : Number of Unemployment in thousands 

data ("economics_long")

#Sum of varibles group by date
economics_long %>%
    group_by(date, variable) %>%
    summarise(Frequency = sum(value)) %>%
    arrange(desc(Frequency)) %>%
    formattable(list(Frequency = color_bar("orange")), align = 'l')
