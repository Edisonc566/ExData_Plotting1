# Course Project 1
# Edison

# download and import data
library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")
path <- file.path(path, "household_power_consumption.txt")
hpcdata <-  read.table(path
                       , skip = 0
                       , sep = ";"
                       , header = TRUE
                       , as.is = T )

# adjust the date and time
hpcdata$Time <- strptime( paste(hpcdata$Date, hpcdata$Time), format = "%d/%m/%Y %H:%M:%S")
hpcdata$Date <- ( as.Date(hpcdata$Date,"%d/%m/%Y" ))
hpcdata$Global_active_power <- as.numeric(hpcdata$Global_active_power)

# get subset
subsetdata <- hpcdata[(hpcdata$Date == "2007-02-01"|hpcdata$Date =="2007-02-02"), ]


## generate plot3.png

png(file = "plot3.png")

with(subsetdata, plot(Time,Sub_metering_1
                      , type = "l"
                      , xlab = ""
                      , ylab= "Energy sub metering"))
with(subsetdata, lines(Time, Sub_metering_2,col = "red"))
with(subsetdata, lines(Time, Sub_metering_3,col = "blue"))
legend("topright"
       , col = c("black","red", "blue")
       , lty = 1
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

