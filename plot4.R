data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

DateTimeprep <- paste(data$Date, data$Time)
data$DateTime <- strptime(DateTimeprep, format ="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2,2)) 

#plot 2
plot(data$DateTime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

#Voltage plot
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot3
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#reactive plot
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()