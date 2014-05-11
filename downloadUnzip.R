# Download data

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="exdata-data-household_power_consumption.zip", method="curl")
dateDownloaded <- date()
write(dateDownloaded,file="exdata-data-household_power_consumption.zip.date.txt")

# Unzip dataset
unzip(zipfile="exdata-data-household_power_consumption.zip")