#R#Read and subset Raw data to relevant dates - Set to working directory where file was downloaded
rawData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), 
                                  value = TRUE), sep = ";", header = TRUE, , na.strings = "?", col.names = c("Date", "Time", 
                                                                                                             "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                                                                                             "Sub_metering_2", "Sub_metering_3"))

#Convert date and time strings to POSIXlt and POSIXt class
rawData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <-strptime(paste(rawData$Date, rawData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Initiate PNG filename
png(filename = "plot2.png", width = 480, height = 480)

#Plot Graph 
plot(DateTime, rawData$Global_active_power, col = "black", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close PNG connection
dev.off()
