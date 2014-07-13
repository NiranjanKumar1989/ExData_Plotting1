power_data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")
power_data <- cbind(strptime(paste(power_data[, 1], power_data[, 2], sep =" "), format = "%d/%m/%Y %H:%M:%S"), power_data[, 3:9])
names(power_data) <- c("Date_Time", names(power_data)[2:8])
power_data <- power_data[power_data$Date_Time >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & power_data$Date_Time <= strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S"),]


hist(power_data$Global_active_power, col = "Red", main = "Globla Active Power", xlab = "Globla Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
