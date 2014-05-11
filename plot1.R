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
png("plot1.png",
    width = 480,
    height = 480)

# Make the plot
hist(power$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power")

# Close png device
dev.off()