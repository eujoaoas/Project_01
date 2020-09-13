NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal_class_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_emissions_data <- NEI[NEI$SCC %in% SCC$SCC, ]
coal_emissions_year <- aggregate(coal_emissions_data$Emissions, by=list(coal_emissions_data$year), FUN=sum)
colnames(coal_emissions_year) <- c("year", "emissions")
png("plot4.png")
plot(coal_emissions_year$year, coal_emissions_year$emissions, type = "o",
     xlab = "Year", ylab = "Total Emissions", main = "Coal emissions of PM2.5 in US from 1998 to 2008")
dev.off()