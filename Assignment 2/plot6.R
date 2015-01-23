#Assuming both rds file are present in the current directory
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
reqdRows <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]

motorNames <- grep("motor", SCC$Short.Name, ignore.case = T)
motorSCCRows <- SCC[motorNames, ]
motorNEIRows <- reqdRows[reqdRows$SCC %in% motorSCCRows$SCC, ]

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

g <- ggplot(motorNEIRows, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
print(g+geom_point())
dev.off()