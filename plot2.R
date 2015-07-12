source("./getData.R")
# get the data
data <- getData()
data$Date = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- NULL

# open the png device
png(filename = "plot2.png")

# set window to show only 1 row and 1 column
par(mar = c(5, 4, 5, 4), mfrow = c(1, 1))
with(data, plot(Date, Global.Active.Power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))

# close device to save the plot
dev.off()