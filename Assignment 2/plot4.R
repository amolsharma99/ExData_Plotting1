#Assuming both rds file are present in the current directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalNames <- grep("coal", SCC$Short.Name, ignore.case = T)
coalSCCRows <- SCC[coalNames, ]
coalNEIRows <- NEI[NEI$SCC %in% coalSCCRows$SCC, ]

coalEmissions <- aggregate(coalNEIRows$Emissions, list(coalNEIRows$year), FUN = "sum")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px")
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()