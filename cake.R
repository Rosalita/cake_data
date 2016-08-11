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

#Date column is now a Date variable
#Time column is still a POSIXct variable
#


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
               

#third plot try make a plot facetted by food type.
ggplot(data, aes(Date, Time)) +
geom_point() +
scale_x_date(date_breaks = "2 month", date_labels = "%b")+  #use scale_*_date for date variables
scale_y_datetime(date_breaks = "2 hours", date_labels = "%H:%M")+ #use scale_*_datetime for POSIXct variables
facet_wrap(~Food, nrow =2)+
  geom_smooth(method ="gam", se = FALSE)


#fourth plot show all foods by date and time, try add smooth lines
ggplot(data, aes(Date, Time, colour = Food))+
  geom_point() +
  ggtitle("Free Food Left in the Kitchen at Work")+
  labs(x="Date", y="Time of Day")+
  scale_x_date(date_breaks = "1 month", date_labels = "%b %y")+  #use scale_*_date for date variables
  scale_y_datetime(date_breaks = "2 hours", date_labels = "%H:%M")+ #use scale_*_datetime for POSIXct variables
  geom_smooth(method ="gam", se = FALSE)
