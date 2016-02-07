#!/usr/bin/Rscript
###############################################
# Coursera Class - Exploratory Data Analysis
# Kwan Lowe
# Week 1 Project
###############################################

library(lubridate)
png(file="plot2.png", height=480, width=480)

# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

kll <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
TempDateTime <- paste(kll$Date, kll$Time)
kll$DateTime <- strptime(TempDateTime, "%d/%m/%Y %H:%M:%S")

kll$Date <- as.Date(dmy(kll$Date))
kll$Date <- as.Date(ymd(kll$Date))
kll_subset <- subset(kll, Date=="2007-02-01" | Date=="2007-02-02")

with(kll_subset, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)" ))

# kll_subset$Global_active_power <- as.numeric(kll_subset$Global_active_power)
# hist(kll_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)" , col="red")
dev.off()
