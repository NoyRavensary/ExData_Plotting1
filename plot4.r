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

# Plot 4: Multiple Plots (Global Active Power, Voltage, Energy Sub Metering, Global Reactive Power)
png(filename = "week1-plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power", xaxt = "n")
axis(1, at = x_positions, labels = x_labels)

# Plot 2: Voltage
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = x_positions, labels = x_labels)

# Plot 3: Energy Sub Metering
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
axis(1, at = x_positions, labels = x_labels)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global Reactive Power", xaxt = "n")
axis(1, at = x_positions, labels = x_labels)

dev.off()
