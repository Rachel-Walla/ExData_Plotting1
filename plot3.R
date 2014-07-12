data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 "household_power_consumption.txt"'),header=F, sep=';')
# Thanks David Leung in the discussion forum for the help with the data import https://class.coursera.org/exdata-004/forum/thread?thread_id=19

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

DateTimeprep <- paste(data$Date, data$Time)
data$DateTime <- strptime(DateTimeprep, format ="%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()