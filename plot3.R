library(sqldf)
library(datasets)

#reading data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql, header=TRUE, sep=";", na.strings=c("?"))

#converting date time format
dateTime <-paste(myData$Date, myData$Time)
myData$DateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
myData$DateTime <- as.POSIXct(myData$DateTime)

#plot 3
with(myData, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()