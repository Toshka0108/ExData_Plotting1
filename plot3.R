#setwd("C:/Users/Ольга/Desktop/майн/git/my_new/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = TRUE)
head <- colnames(data)
data <- read.table("household_power_consumption.txt", nrows = 2880, sep = ";", 
                   header = TRUE, skip = 66636, col.names = head)
date_time <- paste(data$Date,data$Time)
data$Date <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S" )
data <- data[,-2]
png("plot3.png")
with(data, plot(Date,Sub_metering_1, main = "", 
                ylab = "Energy sub metering", xlab = "", "n"))
with(data, lines(Date, Sub_metering_1))
with(data, lines(Date, Sub_metering_2, col = "red"))
with(data, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, 
       col = c("black","red", "blue"))
dev.off()