data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

DateTimeprep <- paste(data$Date, data$Time)
data$DateTime <- strptime(DateTimeprep, format ="%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()