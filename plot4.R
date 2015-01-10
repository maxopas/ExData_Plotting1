source("read_data.R")
data <- read_data()

png("data/plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(data$datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power(kilowatts)")
plot(data$datetime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy submetering")
lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")
with(data, plot(datetime, Global_reactive_power, type="l"))
dev.off()
