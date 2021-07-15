
# Date: 14 July 2021
# from class


rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

myVar = readline(prompt = "Enter something :")
cat("you typed :",myVar)
typeof(myVar)

myNumber <- as.numeric(myVar)



#Ask Data about Mileage 
library(tidyverse)# check the data
View(mpg) # note the capital ‘V’


# run simple plot
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy ))


# add some colour
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy ), color = "blue")


# add some size
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy, size = class))



# add some colour
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy, color = class))

# add some size and colour 1
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy, color = class, size = class))


# add some size and colour 2
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy, color = class, size = cyl))



# make a comparison
# hwy mileage
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy )) 

# city mileage
ggplot(data = mpg) + geom_point(mapping = aes(x = mpg$displ, y = mpg$cty ))


# Gopesh's Analysis of the offset! :-)
#incorporate hwy and cty mileage together in same plot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue") + geom_point(mapping = aes(x = displ, y = cty), color="red")



ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = cyl), color = "blue") + geom_point(mapping = aes(x = displ, y = cty, size = cyl), color="red")

# adding smooth line
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = cyl), color = "Blue") +  geom_point(mapping = aes(x = displ, y = cty, size = cyl), color="Red") + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), color = "Blue") + geom_smooth(mapping = aes(x = displ, y = cty, linetype = drv), color = "Red")


# adding smooth line, no size
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "Blue") +  geom_point(mapping = aes(x = displ, y = cty), color="Red") + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), color = "Blue") + geom_smooth(mapping = aes(x = displ, y = cty, linetype = drv), color = "Red")

# just the smooth lines
ggplot(data = mpg) +  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), color = "Blue") + geom_smooth(mapping = aes(x = displ, y = cty, linetype = drv), color = "Red")




# install.packages("plotly")
library(plotly)
p <- ggplot(mpg, aes(displ, hwy, color = cty))
p <- p + geom_point() + stat_smooth()
p <- ggplotly(p)
p



######



rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.


# install new data set about flight information
# install.packages("nycflights13")

library(nycflights13)
library(tidyverse)


View(flights)

names(nycflights13::flights)
summary(flights)
summary(nycflights13::flights)


# how much data is missing from a column
summary(flights$dep_delay)


flights <- nycflights13::flights
View(flights)




# Gimme all data where month = 1 and day = 1
filter(flights, month == 1)

monthAndDayIsOne <- filter(flights, month == 1)

monthIsOneAndDeptTimeIs554 <- filter(flights, month == 1, dep_time == 554)

filter(flights, month >= 11)


# arrage by order
arrange(flights, dep_time)

arrange(flights, desc(dep_time))

# select specific cols
select(flights, year, month, day)
YMD_data <- select(flights, year, month, day)


# create new columns in a new dataset

newDataXY <- mutate(flights,xxDAY = day, yyMONTH = month)
newDataXY <- mutate(flights,xxDAYPlusONE = day+1, yyMONTHPlusOne = month+1)


newDataXY <- mutate(flights, rate = (month+dep_time) /sched_dep_time)


newDataXY <- mutate(flights, MYNEWCOL = (month+dep_time) /sched_dep_time)



by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))



# using the between() function to isolate a range of data. 
# not using between()
AADATA <- filter(flights, arr_time >= 1100, arr_time <= 1270)


#using the between function 
AADATA_between <- filter(flights, between(flights$arr_time, 1100, 1270 ))