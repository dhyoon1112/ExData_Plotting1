setwd("C:\\Users\\dyoon\\Documents\\Projects\\R Programming\\Exploratory Data Analysis\\Wk 1\\exdata_data_household_power_consumption")

#read file
file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#subset for 2007-02-01 & 2007-02-02
feb <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

#append the day of the date and timestamp to the subset
datetimestamp <- strptime(paste(feb$Date, feb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
feb <- cbind(feb, datetimestamp)

#change data types for Global_active_power
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#plot onto a png file
png(file = "plot2.png")
with(feb, plot(datetimestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()