
loadPlotData <- function() {
	
	if (exists("data") & is.data.frame(data)) {
		message("using cache data...")
		return(data)
	}

	message("loading data...")
	
	# Define first and second columns as Date and Time character, and the other variables as numeric
	dataColClasses <- c(rep("character",2), rep("numeric",7))
	
	# Define data columns names as the txt file
	dataColNames <- strsplit("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3",";")
	
	# define the location of file data
	fileData <- "./data/household_power_consumption.txt"
	
	# Get only 2 days data (nrows=2880) from 2007-02-01 (skip=66636)
	data <- read.csv2(fileData, colClasses=dataColClasses, dec=".", sep=";", na.strings="NA", skip=66636, nrows=2880)
	
	# Force column names
	names(data) <- dataColNames[[1]]
	
	# Define timestamp 
	data <- cbind(Timestamp = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="GMT"), data )
	
	# Removing Date and Time columns
	data <- data[c(-2,-3)]

}

# Force US Locale for present desirable week days format 

Sys.setlocale("LC_TIME","English_United States")

data <- loadPlotData()