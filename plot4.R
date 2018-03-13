#Read and subset Raw data to relevant dates - Set to working directory where file was downloaded
rawData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), 
                                  value = TRUE), sep = ";", header = TRUE, , na.strings = "?", col.names = c("Date", "Time", 
                                  "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

#Convert date and time strings to POSIXlt and POSIXt class
rawData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <-strptime(paste(rawData$Date, rawData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Initiate PNG filename
png(filename = "plot4.png")

#Set up 2 x 2 view
par(mfrow = c(2, 2))

#Plot 1
plot(DateTime, rawData$Global_active_power, col = "black", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot 2
plot(DateTime, rawData$Voltage, col = "black", type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(DateTime, rawData$Sub_metering_1, type="n", col= "blue", xlab="", ylab="Energy sub metering")
lines(DateTime, rawData$Sub_metering_1, col = "blue", type = "l")
lines(DateTime, rawData$Sub_metering_2, col = "red", type = "l")
lines(DateTime, rawData$Sub_metering_3, col = "black", type = "l")
legend("topright", pch = 1, col = c("blue", "red", "black"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
plot(DateTime, rawData$Global_reactive_power, col = "black", type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close PNG connection
dev.off()
