source("read_data.R")
data <- read_data()

png("data/plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
