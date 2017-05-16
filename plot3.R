###Code to create plot3.png

#Read in data from file
alldata <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#set column names
names(alldata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset the data for the dates in question
subdata <- subset(alldata, alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007")

#Change the date and time variables into type Date and POSIXlt

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"], "2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

plot(subdata$Time, subdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(subdata, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(subdata, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
with(subdata, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))

legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
