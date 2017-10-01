setwd("H:\\DataScience\\Coursera\\Exploratory Data Analysis\\Week 1\\Assignment")

housePowerConsumption <- read.csv("household_power_consumption.txt",header = T, sep = ";", stringsAsFactors = F)

housePowerConsumption$Date <- as.Date(housePowerConsumption$Date, "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

FebData <- housePowerConsumption[housePowerConsumption$Date >= date1 & housePowerConsumption$Date <= date2, ]
dateTimeData <- strptime(paste(FebData$Date, FebData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
Global_active_power <- as.numeric(FebData$Global_active_power)
subMetering1 <- as.numeric(FebData$Sub_metering_1)
subMetering2 <- as.numeric(FebData$Sub_metering_2)
subMetering3 <- as.numeric(FebData$Sub_metering_3)
voltage <- as.numeric(FebData$Voltage)
global_reactive_power <- as.numeric(FebData$Global_reactive_power)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
plot(dateTimeData, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(dateTimeData, voltage, type="l", xlab = "", ylab = "Voltage")

plot(dateTimeData, subMetering1, col = "black", type="l", xlab = "", ylab = "Energy sub metering")
lines(dateTimeData, subMetering2, col = "red", type="l")
lines(dateTimeData, subMetering3, col = "blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTimeData, global_reactive_power, type="l", xlab = "", ylab = "Global_reactive_power")

dev.off()
