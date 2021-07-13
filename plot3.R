#Reading dataset
data <- read.table("C:/Users/u557g3/Documents/household_power_consumption.txt",skip=1,sep=";")
#Renaming the fields in dataset
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subsetting the dates in dataset
subset_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


# Transforming the Date and Time fields
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$Time <- strptime(subset_data$Time, format="%H:%M:%S")
subset_data[1:1440,"Time"] <- format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"] <- format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Making plots
plot(subset_data$Time,subset_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Giving title to plot
title(main="Energy sub-metering")