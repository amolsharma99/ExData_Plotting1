library(sqldf)
library(datasets)

#reading data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql, header=TRUE, sep=";", na.strings=c("?"))

#plot1
hist(myData$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()