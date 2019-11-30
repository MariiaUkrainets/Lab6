
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
new_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')


new_df$DateTime <- paste(new_df$Date, new_df$Time)
new_df$Time <- strptime(paste(new_df$Date, new_df$Time), '%d/%m/%Y %H:%M:%S')
new_df$Date <- as.Date(new_df$Date, '%d/%m/%Y')

png('plot3.png', width=480, height=480)
plot(new_df$Time, new_df$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(new_df$Time, new_df$Sub_metering_2, type = 'l', col = 'red')
lines(new_df$Time, new_df$Sub_metering_3, type = 'l', col = 'blue')
colour <- c('black', 'red', 'blue')
leg <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', lty = 1, col = colour, legend = leg)
dev.off()