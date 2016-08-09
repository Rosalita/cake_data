#install.packages("readxl")
library(readxl)
library(ggplot2)

#setwd("C:/git/cake_data")
setwd("C:/Dev/git/cake_data")
data <- read_excel("cake_data.xlsx")

# clean NA rows out
data <- na.omit(data)

ggplot(data, aes(Date, Time, colour = Food))+
geom_point() +
ggtitle("Free Food Left in the Kitchen at Work")+
labs(x="Date", y="Time of Day")

