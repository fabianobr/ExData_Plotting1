source("loadingData.R")

png(file="plot3.png")

with(data, plot(Timestamp, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Timestamp, Sub_metering_2, type="l", ylab = "Energy sub metering", xlab = "", col="red"))
with(data, lines(Timestamp, Sub_metering_3, type="l", ylab = "Energy sub metering", xlab = "", col="blue"))

legend("topright", pch = "", lty=1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()