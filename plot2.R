NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, NEI$fips == "24510")
Baltimore_emissions <- aggregate(Baltimore$Emissions, by = list(Baltimore$year), FUN = sum)
png("plot2.png")
plot(Baltimore_emissions$Group.1, Baltimore_emissions$x, type = "l",
                               xlab = "Year", ylab = "Total Emissions (tons)", 
                               main = "Total Emissions of PM2.5 in Baltimore City")
dev.off()
