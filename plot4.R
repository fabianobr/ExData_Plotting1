source("loadingData.R")

png(file="plot4.png")

par(mfrow = c(2, 2))

# plot 1 / 4
with(data, plot(Timestamp, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l"))

# plot 2 / 4
with(data, plot(Timestamp, Voltage, xlab = "datetime", type="l"))

# plot 3 / 4
with(data, plot(Timestamp, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Timestamp, Sub_metering_2, type="l", ylab = "Energy sub metering", xlab = "", col="red"))
with(data, lines(Timestamp, Sub_metering_3, type="l", ylab = "Energy sub metering", xlab = "", col="blue"))

legend("topright", pch = "", lty=1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# plot 4 / 4
with(data, plot(Timestamp, Global_reactive_power, xlab = "datetime", type="l"))

dev.off()

par(mfrow = c(1, 1))

dev.off()