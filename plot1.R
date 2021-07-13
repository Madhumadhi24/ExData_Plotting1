#Reading dataset
data <- read.table("C:/Users/u557g3/Documents/household_power_consumption.txt",skip=1,sep=";")
#Renaming the fields in dataset
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subsetting the dates in dataset
subset_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

#Making histogram
hist(as.numeric(as.character(subset_data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Giving title to histogram
title(main="Global Active Power")