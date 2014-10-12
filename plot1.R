# Assignment 1 - Plot 1

# read and format data
print("Reading Data")
hpc <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
hpc$DateTime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

# generate plot
print("Generating Plot")
hist(hpc$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (killowatts)", ylab="Frequency")