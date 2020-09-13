NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltLA_car_data <- subset(NEI, NEI$fips=="24510" |
                                  NEI$fips=="06037" &
                                  NEI$type=="ON-ROAD")
baltLA_car_year <- aggregate(baltLA_car_data$Emissions, 
                             by=list(baltLA_car_data$fips, baltLA_car_data$year),
                             FUN=sum)
colnames(baltLA_car_year) <- c("City", "Year", "Emissions")
library(ggplot2)
png("plotT.png")
qplot(Year, Emissions, data = baltLA_car_year, color = City, geom = "line") +
        ggtitle("Emissions of PM2.5 in Baltimore City and Los Angeles")+
        xlab("Year") + ylab("Total Emissions from motor veichles")
dev.off()