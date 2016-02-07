#!/usr/bin/Rscript
###############################################
# Coursera Class - Exploratory Data Analysis
# Kwan Lowe
# Week 1 Project
###############################################

library(lubridate)
png(file="plot3.png", height=480, width=480)

# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

kll <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
TempDateTime <- paste(kll$Date, kll$Time)
kll$DateTime <- strptime(TempDateTime, "%d/%m/%Y %H:%M:%S")

kll$Date <- as.Date(dmy(kll$Date))
kll$Date <- as.Date(ymd(kll$Date))
kll_subset <- subset(kll, Date=="2007-02-01" | Date=="2007-02-02")

# with(kll_subset, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)" ))

# kll_subset$Global_active_power <- as.numeric(kll_subset$Global_active_power)
# hist(kll_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)" , col="red")

graphLegend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# using with(), plot the Sub_metering_1 data in black
with(kll_subset, plot(DateTime,Sub_metering_1, type="l", ylab = "Energy Sub Metering", col="black"))
# using with(), plot the Sub_metering_2 data in red
points(kll_subset$DateTime, kll_subset$Sub_metering_2, type="l", col="red")
# using with(), plot the Sub_metering_3 data in red
points(kll_subset$DateTime, kll_subset$Sub_metering_3, type="l", col="blue")

legend("topright", lty = 1, col =c("grey", "red", "blue"),legend = graphLegend)
dev.off()
