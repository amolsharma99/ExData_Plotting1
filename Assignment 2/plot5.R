#Assuming both rds file are present in the current directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
reqdRows <- NEI[NEI$fips == "24510", ]

motorNames <- grep("motor", SCC$Short.Name, ignore.case = T)
motorSCCRows <- SCC[motorNames, ]
motorNEIRows <- reqdRows[reqdRows$SCC %in% motorSCCRows$SCC, ]

motorEmissions <- aggregate(motorNEIRows$Emissions, list(motorNEIRows$year), FUN = "sum")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot5.png", 
    width = 480, height = 480, 
    units = "px")
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()