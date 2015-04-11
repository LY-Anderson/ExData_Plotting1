#######################
# Create Plot 3

######################
# Housekeeping

setwd("~/Documents/Lisa Documents/Coursera_Data_Science/Ex_Data_Analysis/Work/ExData_Plotting1")
library(date)
library(lubridate)

######################
# Load data and keep only
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
png(file="plot3.png", bg="transparent")


#####################
# Multiple Line Plot
# Y is Energy sub metering variables (1, 2, and 3)
# X is days of the week (Thu, Fri, Sat)
plot3 <- plot(febdata$DateTime, febdata$Sub_metering_1, ylab="Energy sub metering", type="n", xlab="")
lines(febdata$DateTime, febdata$Sub_metering_1, col="black")
lines(febdata$DateTime, febdata$Sub_metering_2, col="red")
lines(febdata$DateTime, febdata$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

####################
# Close png device
dev.off()

