source("./getData.R")
# get the data
data <- getData()
data$Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL

# open the png device
png(filename = "plot3.png")

# set window to show only 1 row and 1 column
par(mar = c(5, 4, 5, 4), mfrow = c(1, 1))
with(data, {
    plot(Date, Sub.Metering.1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(Date, Sub.Metering.1, type = "l")
    points(Date, Sub.Metering.2, type = "l", col = "red")
    points(Date, Sub.Metering.3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")
})

# close device to save the plot
dev.off()