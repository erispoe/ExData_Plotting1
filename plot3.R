###############################################
##              Prepare Data                 ##
###############################################

# Load data
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

# Merge and convert date and time
power$DateTime = strptime(paste(power$Date, power$Time), "%d/%m/%Y %T")

# Subset the date on the dates we want:
# These are the two dates we are interested in:
dates  <- c("01/02/2007", "02/02/2007")
dates  <- as.Date(dates, "%d/%m/%Y")

# Subset the data corresponding to these two dates
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date %in% dates,]

###############################################
##                Make Plot                  ##
###############################################

# Open png device
png("plot3.png",
    width = 480,
    height = 480)

# Make the plot
## Base plot with Sub_metering_1
plot(power$DateTime,
     power$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     main = "",
     type = "l",
     col = "black"
     )

## Sub_metering_2 line
lines(power$DateTime,
      power$Sub_metering_2,
      col = "red")

## Sub_metering_3 line
lines(power$DateTime,
      power$Sub_metering_3,
      col = "blue")

## Legend
legend("topright",
       col = c("black", "red", "blue"),
       lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close png device
dev.off()