dframe <- loadData()

par(mfrow=c(2,2))

# first plot 1 Global Active Power (similar plot 2)
plot(dframe$timestamp,dframe$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# second plot 2 Voltage (same as plot 2 by another variable voltage)
plot(dframe$timestamp,dframe$Voltage, type="l", xlab="datetime", ylab="Voltage")

# third plot 3 Energy sub metering (similar as plot 3)
plot(dframe$timestamp,dframe$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dframe$timestamp,dframe$Sub_metering_2,col="red")
lines(dframe$timestamp,dframe$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

# fourth plot 4 Global Reactive Power
plot(dframe$timestamp,dframe$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()