library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- subset(NEI, NEI$fips == "24510")
Baltimore_emissions <- aggregate(Baltimore$Emissions, by = list(Baltimore$type, Baltimore$year), FUN = sum)
colnames(Baltimore_emissions) <- c("Type","Year", "Emissions")
head(Baltimore_emissions)
png("plot3.png")
qplot(Year, Emissions, data = Baltimore_emissions, color = Type, geom = "line") +
        ggtitle("Total Emissions of PM2.5 in Baltimore City by polluant type") +
        xlab("Year") + ylab("Total Emiossions of PM2.5 (tons)")
dev.off()

        