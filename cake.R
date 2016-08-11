#install.packages("readxl")
library(readxl)
library(ggplot2)

#setwd("C:/git/cake_data")
setwd("C:/Dev/git/cake_data")
data <- read_excel("cake_data.xlsx")

# clean NA rows out
data <- na.omit(data)
str(data)
#convert the date column to be a date so ggplot2 can manipulate it
data[,1] <- as.Date(data[,1])

#first plot show all foods by date and time
ggplot(data, aes(Date, Time, colour = Food))+
  geom_point() +
  ggtitle("Free Food Left in the Kitchen at Work")+
  labs(x="Date", y="Time of Day")


#second plot - show foods arranged by date
ggplot(data, aes(Date, Food, colour = Food))+
geom_point() +
ggtitle("Free Food Left in the Kitchen at Work")+
labs(x="Date", y="Food")+
scale_colour_hue(guide=FALSE)+ #to remove legend 
scale_x_date(date_breaks = "1 month", date_labels = "%b %y")
               

