#Assuming both rds file are present in the current directory
NEI <- readRDS("summarySCC_PM25.rds")
reqdRows <- NEI[NEI$fips == "24510", ]
SCC <- readRDS("Source_Classification_Code.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(reqdRows$Emissions, list(reqdRows$year), FUN = "sum")
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()