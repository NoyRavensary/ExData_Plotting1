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

# Create a vector for custom x-axis labels
x_labels <- c("Thu", "Fri", "Sat")
x_positions <- c(as.POSIXct("2007-02-01 00:00:00"), as.POSIXct("2007-02-02 00:00:00"), as.POSIXct("2007-02-03 00:00:00"))

# Plot 2: Global Active Power over Time
png(filename = "week1-plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = x_positions, labels = x_labels)
dev.off()
