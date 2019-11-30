```R

df <- read.table('E://R//household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
new_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')

new_df$Date <- as.Date(new_df$Date, '%d/%m/%Y')
new_df$DateTime <- paste(new_df$Date, new_df$Time)
new_df$Time <- strptime(paste(new_df$Date, new_df$Time), '%d/%m/%Y %H:%M:%S')

png('plot1.png', width=480, height=480)
hist(new_df$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
dev.off()

png('plot2.png', width=480, height=480)
plot(new_df$Time, new_df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()



png("plot3.png", width=480, height=480)
plot(my_dates$DateTime, my_dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(my_dates$DateTime, my_dates$Sub_metering_2, type = "l", col = "red")
lines(my_dates$DateTime, my_dates$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.off()

```