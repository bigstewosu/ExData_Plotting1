###Code to create plot1.png

#Read in data from file
alldata <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#set column names
names(alldata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset the data for the dates in question
subdata <- subset(alldata, alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007")
hist(as.numeric(as.character(subdata$Global_active_power)), main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
