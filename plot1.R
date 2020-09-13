NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
sum_year <- aggregate(NEI$Emissions, by = list(year = NEI$year), FUN = sum)
png("plot1.png")
plot(sum_year$year, sum_year$x, type = "l", xlab = "Year", ylab = "Total Emissions of PM2.5 (Ton)", 
     main = "Total Emissions of PM2.5 in Baltimore City")
dev.off()
