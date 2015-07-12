source("./getData.R")
# get the data
data <- getData()

# open the png device
png(filename = "plot1.png")

# set window to show only 1 row and 1 column
par(mar = c(5, 4, 5, 4), mfrow = c(1, 1))
with(data, hist(Global.Active.Power, col = "red", xlab = "Global Active Power (killowatts)", ylab = "Frequency", main = "Global Active Power"))

# close device to save the plot
dev.off()