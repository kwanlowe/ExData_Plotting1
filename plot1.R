#!/usr/bin/Rscript

###############################################
# Coursera Class - Exploratory Data Analysis
# Kwan Lowe
# Week 1 Project
###############################################
library(lubridate)
png(file="plot1.png")

# Read in the power consumption file
kll <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# Convert the Date to something we can use via lubridate()
kll$Date <- as.Date(dmy(kll$Date))
kll$Date <- as.Date(ymd(kll$Date))

# Subset the range...
kll_subset <- subset(kll, Date=="2007-02-01" | Date=="2007-02-02")

# Convert Global_active_power from string to numeric
kll_subset$Global_active_power <- as.numeric(kll_subset$Global_active_power)

# Plot the beast...
hist(kll_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)" , col="red")
dev.off()
