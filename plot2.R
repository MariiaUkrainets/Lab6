
df <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
new_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')


new_df$DateTime <- paste(new_df$Date, new_df$Time)
new_df$Time <- strptime(paste(new_df$Date, new_df$Time), '%d/%m/%Y %H:%M:%S')
new_df$Date <- as.Date(new_df$Date, '%d/%m/%Y')

png('plot2.png', width=480, height=480)
plot(new_df$Time, new_df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()