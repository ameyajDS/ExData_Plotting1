setwd("H:\\DataScience\\Coursera\\Exploratory Data Analysis\\Week 1\\Assignment")

housePowerConsumption <- read.csv("household_power_consumption.txt",header = T, sep = ";", stringsAsFactors = F)

housePowerConsumption$Date <- as.Date(housePowerConsumption$Date, "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

FebData <- housePowerConsumption[housePowerConsumption$Date >= date1 & housePowerConsumption$Date <= date2, ]
dateTimeData <- strptime(paste(FebData$Date, FebData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
Global_active_power <- as.numeric(FebData$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(dateTimeData, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
