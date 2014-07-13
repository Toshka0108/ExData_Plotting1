#setwd("C:/Users/Ольга/Desktop/майн/git/my_new/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = TRUE)
head <- colnames(data)
data <- read.table("household_power_consumption.txt", nrows = 2880, sep = ";", 
                   header = TRUE, skip = 66636, col.names = head)
date_time <- paste(data$Date,data$Time)
data$Date <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S" )
data <- data[,-2]
png("plot2.png")
with(data, plot(Date,Global_active_power, main = "", 
                ylab = "Global Active Power (kilowatts)", xlab = "", "l") )
dev.off()