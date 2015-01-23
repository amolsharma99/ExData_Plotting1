#Assuming both rds file are present in the current directory
NEI <- readRDS("summarySCC_PM25.rds")
reqdRows <- NEI[NEI$fips == "24510", ]
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot3.png", 
    width = 480, height = 480, 
    units = "px")
g <- ggplot(reqdRows, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
print(g+geom_point())
dev.off()