setwd("~/TrainingR/ExploratoryAnalysisProject1")
data.df <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")  #Read in data
data.subdf <- data.df[data.df$Date %in% c("1/2/2007","2/2/2007"), c(1:5,7:9)]     #Subset to dates of interest
data.subdf$DateTime <- as.POSIXct(paste(data.subdf$Date,data.subdf$Time), format= "%d/%m/%Y %H:%M:%S")    #Convert to datetime
data.subdf$Global_active_power[data.subdf$Global_active_power=="?"] <- NA           #Clean up missing values
data.subdf$Global_reactive_power[data.subdf$Global_reactive_power=="?"] <- NA           #Clean up missing values
data.subdf$Voltage[data.subdf$Voltage=="?"] <- NA           #Clean up missing values
data.subdf$Sub_metering_1[data.subdf$Sub_metering_1=="?"] <- NA           #Clean up missing values
data.subdf$Sub_metering_2[data.subdf$Sub_metering_2=="?"] <- NA           #Clean up missing values
data.subdf$Global_active_power <- as.numeric(levels(data.subdf$Global_active_power))[data.subdf$Global_active_power]  #Convert from factor to numeric
data.subdf$Global_reactive_power <- as.numeric(levels(data.subdf$Global_reactive_power))[data.subdf$Global_reactive_power]  #Convert from factor to numeric
data.subdf$Voltage <- as.numeric(levels(data.subdf$Voltage))[data.subdf$Voltage]  #Convert from factor to numeric
data.subdf$Sub_metering_1 <- as.numeric(levels(data.subdf$Sub_metering_1))[data.subdf$Sub_metering_1]  #Convert from factor to numeric
data.subdf$Sub_metering_2 <- as.numeric(levels(data.subdf$Sub_metering_2))[data.subdf$Sub_metering_2]  #Convert from factor to numeric

png(filename="plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

#Plot 1
plot(data.subdf$DateTime, data.subdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(data.subdf$DateTime, data.subdf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(data.subdf$DateTime, data.subdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data.subdf$DateTime, data.subdf$Sub_metering_2, col = "red")
lines(data.subdf$DateTime, data.subdf$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

#Plot 4
plot(data.subdf$DateTime, data.subdf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()