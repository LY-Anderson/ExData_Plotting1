#######################
# Create Plot 4

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

febdata$datetime <- paste(febdata$Date," ",febdata$Time)
febdata$datetime <- dmy_hms(febdata$datetime)


####################
# Open png device
# Choose a transparent background
# to match the example plots provided
png(file="plot4.png", bg="transparent")

#####################
# Set up the rows and columns
# for a multi-plot plot
par(mfrow=c(2,2))

#####################
# Subplot A: Global Active Power to Date
with(febdata, plot(datetime, Global_active_power, ylab="Global Active Power", type="n", xlab=""))
lines(febdata$datetime, febdata$Global_active_power)

####################
# Subplot B: Voltage to Date
with(febdata, plot(datetime, Voltage, type="n"))
lines(febdata$datetime, febdata$Voltage)

#####################
# Subplot C: Sub-Metering to Date
plot3 <- plot(febdata$datetime, febdata$Sub_metering_1, ylab="Energy sub metering", type="n", xlab="")
lines(febdata$datetime, febdata$Sub_metering_1, col="black")
lines(febdata$datetime, febdata$Sub_metering_2, col="red")
lines(febdata$datetime, febdata$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

##################
# Subplot D: Global Reactive Power to Date
with(febdata, plot(datetime, Global_reactive_power, type="n"))
with(febdata, lines(datetime, Global_reactive_power))

###################
# finish recording the plot
# to the png device
dev.off()



