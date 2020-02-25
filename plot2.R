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

## generate plot2.png

png(filename = "plot2.png", width=480, height=480)

plot(x= subsetdata$Time
     ,y= subsetdata$Global_active_power
     ,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)")


dev.off()




