# Assignment 1 - Plot 4

# read and format data
hpc <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc$DateTime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

# generate png plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
with(hpc, plot(DateTime, Global_active_power, type="o", ylab="Global Active Power (killowatts)", xlab="", pch=""))
with(hpc, plot(DateTime, Voltage, type="o", col="black", ylab="Voltage", pch=""))
with(hpc, plot(DateTime, Sub_metering_1, type="o", col="black", ylab="Energy Sub Metering", xlab="", pch=""))
with(hpc, points(DateTime, Sub_metering_2, type="o", col="red", pch=""))
with(hpc, points(DateTime, Sub_metering_3, type="o", col="blue", pch=""))
legend("topright", lwd=2, cex=0.75, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(hpc, plot(DateTime, Global_reactive_power, type="o", col="black", ylab="Global_reactive_power", pch=""))
dev.off()