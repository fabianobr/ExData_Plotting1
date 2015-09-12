source("loadingData.R")

png(file="plot2.png")
with(data, plot(Timestamp, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l"))
dev.off()
