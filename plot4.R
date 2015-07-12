source("./getData.R")
# get the data
data <- getData()
data$Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL

# open the png device
png(filename = "plot4.png")

# set window to show only 1 row and 1 column
par(mar = c(5, 5, 2, 2), mfrow = c(2, 2))
with(data, {
    # top-left plot
    plot(Date, Global.Active.Power, xlab = "", ylab = "Global Active Power", type = "l")
    
    # top-right plot
    plot(Date, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    
    # bottom-left plot
    plot(Date, Sub.Metering.1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(Date, Sub.Metering.1, type = "l")
    points(Date, Sub.Metering.2, type = "l", col = "red")
    points(Date, Sub.Metering.3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", bty = "n")
    
    # bottom-right plot
    plot(Date, Global.Reactive.Power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

# close device to save the plot
dev.off()