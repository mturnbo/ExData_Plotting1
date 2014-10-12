# Assignment 1 - Plot 3

# read and format data
hpc <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc$DateTime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

# generate png plot
png(filename="plot3.png", width=480, height=480, units="px")
with(hpc, plot(DateTime, Sub_metering_1, type="o", col="black", ylab="Energy Sub Metering", xlab="", pch=""))
with(hpc, points(DateTime, Sub_metering_2, type="o", col="red", pch=""))
with(hpc, points(DateTime, Sub_metering_3, type="o", col="blue", pch=""))
legend("topright", lwd=2, cex=0.75, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()