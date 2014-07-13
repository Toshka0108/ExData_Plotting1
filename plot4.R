#setwd("C:/Users/Ольга/Desktop/майн/git/my_new/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = TRUE)
head <- colnames(data)
data <- read.table("household_power_consumption.txt", nrows = 2880, sep = ";", 
                   header = TRUE, skip = 66636, col.names = head)
date_time <- paste(data$Date,data$Time)
data$Date <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S" )
data <- data[,-2]
png("plot4.png")
par(mfrow = c(2,2))
with(data, plot(Date,Global_active_power, main = "", 
                ylab = "Global Active Power", xlab = "", "l") )
with(data, plot(Date,Voltage, main = "", 
                ylab = "Voltage", xlab = "datetime", "l") )
with(data, plot(Date,Sub_metering_1, main = "", 
                ylab = "Energy sub metering", xlab = "", "n"))
with(data, lines(Date, Sub_metering_1))
with(data, lines(Date, Sub_metering_2, col = "red"))
with(data, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, 
       col = c("black","red", "blue"), bty = "n")
with(data, plot(Date,Global_reactive_power, main = "", 
                ylab = "Global_reactive_power", xlab = "datetime", "l") )
dev.off()