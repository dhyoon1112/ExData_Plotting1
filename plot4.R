setwd("C:\\Users\\dyoon\\Documents\\Projects\\R Programming\\Exploratory Data Analysis\\Wk 1\\exdata_data_household_power_consumption")

#read file
file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#subset for 2007-02-01 & 2007-02-02
feb <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

#append the day of the date and timestamp to the subset
datetimestamp <- strptime(paste(feb$Date, feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
feb <- cbind(feb, datetimestamp)
head(feb,5)
#change data types for Global_active_power
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#plot the 4 plots onto a png file
png(file = "plot4.png")
par(mfcol = c(2,2))

##plot (1,1)
with(feb, plot(datetimestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

##plot (2,1)
with(feb, plot(datetimestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(feb, lines(datetimestamp, Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red"))
with(feb, lines(datetimestamp, Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

##plot (1,2)
with(feb, plot(datetimestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

##plot(2,2)
with(feb, plot(datetimestamp, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()