#######################
# Create Plot 1

######################
# Housekeeping

setwd("~/Documents/Lisa Documents/Coursera_Data_Science/Ex_Data_Analysis/Work/ExData_Plotting1")
library(date)

######################
# Load only 2007-02-01 and 2001-02-02
# 1/2/2007 and 02/02/2007
data <- read.table(file='household_power_consumption.txt',header=TRUE,sep=';', colClasses=c("character","character",rep("numeric",7)),na.strings = "?")

febdata <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
rm(data)

febdata$Date <- as.Date(febdata$Date, "%d/%m/%Y")
febdata$Time <- strptime(febdata$Time, "%H:%M:%S")

####################
# Open png device
# Choose a transparent background
# to match the example plots provided
png(file="plot1.png", bg="transparent")

#####################
# Histogram
# red
# Y is frequency
# X is Global Active Power (kilowatts)
plot1 <- hist(febdata$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

####################
# Close png device
dev.off()

