library(sqldf)
library(datasets)

#reading data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql, header=TRUE, sep=";", na.strings=c("?"))

#converting datetime format
dateTime <-paste(myData$Date, myData$Time)
myData$DateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
myData$DateTime <- as.POSIXct(myData$DateTime)

#plot 2
plot(myData$Global_active_power~myData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()