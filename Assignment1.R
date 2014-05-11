## Read data from the dates 2007-02-01 and 2007-02-02
md <- read.table(file = "~/Desktop/household_power_consumption.txt",
				 sep = ";",
				 colClasses = "character",
				 col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, 									  header = TRUE, sep=";")),
				 na.strings = "?",
				 skip = 66637,
				 nrows = 2880,
				 )
				 
## Combining Date and Time in a new date variable "DateTime"
md$DateTime <- strptime(paste(md$Date, md$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 1
md$Global_active_power <- as.numeric(md$Global_active_power) 
hist(md$Global_active_power, 
	 ylim = c(0,1200),
	 xlab = "Global Active Power (kilowatts)",
	 col = "red",
	 main = "",
	 )
title(main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
	 
## Plot 2
plot(md$DateTime, md$Global_active_power,
	 type = "l",
	 xlab = "",
	 ylab = "Global Active Power (kilowatts)"
	 )
dev.copy(png, file = "plot2.png")
dev.off()
	 
## Plot 3
md$Sub_metering_1 <- as.numeric(md$Sub_metering_1)
md$Sub_metering_2 <- as.numeric(md$Sub_metering_2)
md$Sub_metering_3 <- as.numeric(md$Sub_metering_3)
plot(md$DateTime, md$Sub_metering_1,
	 type = "l",
	 xlab = "",
	 ylab = "Energy sub metering"
	 )
lines(md$DateTime, md$Sub_metering_2, col = "red")
lines(md$DateTime, md$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()
	 

## Plot 4
md$Voltage <- as.numeric(md$Voltage)
md$Global_reactive_power <- as.numeric(md$Global_reactive_power)
par(mfrow = c(2, 2))
with(md, {
plot(md$DateTime, md$Global_active_power,
	 type = "l",
	 xlab = "",
	 ylab = "Global Active Power (kilowatts)"
	 )
	 
plot(md$DateTime, md$Voltage,
	 type = "l",
	 xlab = "datatime",
	 ylab = "Voltage"
	 )
	 	 
plot(md$DateTime, md$Sub_metering_1,
	 type = "l",
	 xlab = "",
	 ylab = "Energy sub metering"
	 )
lines(md$DateTime, md$Sub_metering_2, col = "red")
lines(md$DateTime, md$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

plot(md$DateTime, md$Global_reactive_power,
	 type = "l",
	 xlab = "datatime",
	 ylab = "Global_reactive_power"
	 )
})
dev.copy(png, file = "plot4.png")
dev.off()