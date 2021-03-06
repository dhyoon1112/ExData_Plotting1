#read file
file <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

#change data types for Date & Global_active_power
file$Date <- strptime(file$Date, "", format = "%d/%m/%Y")
file$Global_active_power <- as.numeric(file$Global_active_power)

#subset for 2007-02-01 & 2007-02-02
feb <- subset(file, Date == "2007-02-01" | Date == "2007-02-02")

#plot onto a png file
png(file = "plot1.png")
hist(feb$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
