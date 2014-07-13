power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")
power_data <- cbind(strptime(paste(power_data[, 1], power_data[, 2], sep =" "), format = "%d/%m/%Y %H:%M:%S"), power_data[, 3:9])
names(power_data) <- c("Date_Time", names(power_data)[2:8])
power_data <- power_data[power_data$Date_Time >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & power_data$Date_Time <= strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S"),]

par(mfcol = c(2, 2))
plot(power_data$Date_Time, power_data$Global_active_power, type = "n", xlab = "", ylab = "Globla Active Power (kilowatts)")
lines(power_data$Date_Time, power_data$Global_active_power)

plot(power_data$Date_Time, power_data$Sub_metering_1, type = "n", xlab = "", ylab = "Globla Active Power (kilowatts)")
lines(power_data$Date_Time, power_data$Sub_metering_1, col = "Black")
lines(power_data$Date_Time, power_data$Sub_metering_2, col = "Red")
lines(power_data$Date_Time, power_data$Sub_metering_3, col = "Blue")
legend("topright", bty = "n", pch = "-", lwd = 3, adj = 0.2, , x.intersp = 2.5, cex = 0.8, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power_data$Date_Time, power_data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(power_data$Date_Time, power_data$Voltage)

plot(power_data$Date_Time, power_data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(power_data$Date_Time, power_data$Global_reactive_power)

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
