#######################
# Create Plot 2

######################
# Housekeeping

setwd("~/Documents/Lisa Documents/Coursera_Data_Science/Ex_Data_Analysis/Work/ExData_Plotting1")
library(date)
library(lubridate)

######################
# Load only 2007-02-01 and 2001-02-02
# 1/2/2007 and 02/02/2007
data <- read.table(file='household_power_consumption.txt',header=TRUE,sep=';', colClasses=c("character","character",rep("numeric",7)),na.strings = "?")

febdata <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
rm(data)

febdata$DateTime <- paste(febdata$Date," ",febdata$Time)
febdata$DateTime <- dmy_hms(febdata$DateTime)

####################
# Open png device
# Choose a transparent background
# to match the example plots provided
png(file="plot2.png", bg="transparent")

#####################
# Line Plot
# Days of the week
# Y is Global Active Power (kilowatts)
# X is days of the week (Thu, Fri, Sat)
plot(febdata$DateTime, febdata$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="n")
lines(febdata$DateTime, febdata$Global_active_power)

####################
# Turn off device
dev.off()

