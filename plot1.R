#Read and subset Raw data to relevant dates - Set to working directory where file was downloaded
rawData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), 
                                  value = TRUE), sep = ";", header = TRUE, , na.strings = "?", col.names = c("Date", "Time", 
                                                                                                             "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                                                                                             "Sub_metering_2", "Sub_metering_3"))
#Initiate PNG filename
png(filename = "plot1.png")
#Construct Histogram
hist(rawData$Global_active_power, col = "red", breaks = 12, xlab = "Global Active Power (kilowatts)", 
        ylab = "Frequency", main = "Global Active Power")

#Close PNG connection
dev.off()
