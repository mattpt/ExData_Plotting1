setwd("~/TrainingR/ExploratoryAnalysisProject1")
data.df <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")  #Read in data
data.subdf <- data.df[data.df$Date %in% c("1/2/2007","2/2/2007"), c(1,3)]                 #Subset to dates of interest
data.subdf$Global_active_power[data.subdf$Global_active_power=="?"] <- NA           #Clean up missing values
data.subdf$Global_active_power <- as.numeric(levels(data.subdf$Global_active_power))[data.subdf$Global_active_power]  #Convert from factor to numeric
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(data.subdf$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()