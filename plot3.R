setwd("~/TrainingR/ExploratoryAnalysisProject1")
data.df <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")  #Read in data
data.subdf <- data.df[data.df$Date %in% c("1/2/2007","2/2/2007"), c(1,2,7,8,9)]     #Subset to dates of interest
data.subdf$Sub_metering_1[data.subdf$Sub_metering_1=="?"] <- NA           #Clean up missing values
data.subdf$Sub_metering_2[data.subdf$Sub_metering_2=="?"] <- NA           #Clean up missing values
data.subdf$Sub_metering_1 <- as.numeric(levels(data.subdf$Sub_metering_1))[data.subdf$Sub_metering_1]  #Convert from factor to numeric
data.subdf$Sub_metering_2 <- as.numeric(levels(data.subdf$Sub_metering_2))[data.subdf$Sub_metering_2]  #Convert from factor to numeric
data.subdf$DateTime <- as.POSIXct(paste(data.subdf$Date,data.subdf$Time), format= "%d/%m/%Y %H:%M:%S")    #Convert to datetime

png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(data.subdf$DateTime, data.subdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data.subdf$DateTime, data.subdf$Sub_metering_2, col = "red")
lines(data.subdf$DateTime, data.subdf$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()