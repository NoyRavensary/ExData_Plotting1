# Load necessary libraries
library(data.table)

# Read the dataset using read.table
data <- read.table("C:\\Noy Python Course\\coursera\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)

# Subset data for the dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert Date and Time to DateTime using strptime and as.Date
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Remove the original Date and Time columns
data <- data[, !(names(data) %in% c("Date", "Time"))]

# Plot 1: Global Active Power
png(filename = "week1-plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
