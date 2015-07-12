# Reads the household power consumption data. Assumes that the
# household_power_consumption.txt is in the same working directory.
getData <- function() {
    # dataset file path
    datasetFile <- "household_power_consumption.txt"
    # number of lines to skip (earlier than 1st of February, 2007)
    skipLines <- 66637
    # number of lines to read (between 1/Feb/2007 and 2/Feb/2007, inclusive)
    readLines <- 2880
    # column names of the dataset
    names <- c("Date", "Time", "Global.Active.Power", "Global.Reactive.Power", "Voltage", "Global.Intensity", "Sub.Metering.1", "Sub.Metering.2", "Sub.Metering.3")
    
    # read the data between 1/Feb/2007 and 2/Feb/2007
    data <- read.table(datasetFile, header = FALSE, skip = skipLines, nrows = readLines, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), col.names = names)
    
    # return the data
    data
}