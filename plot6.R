#Plot 6

# Vehicle from LA 
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]


NEI_LA_V <- subset(vehiclesNEI,fips=="06037")
NEI_baltimore_V <- subset(vehiclesNEI,fips=="24510")

NEI_LA_V$city <- "Los Angeles County"
NEI_baltimore_V$city <- "Baltimore City"

CITIES <- rbind(NEI_baltimore_V,NEI_LA_V)

png(filename='plot6.png', width=480, height=480, units='px')

ggpbv2 <- ggplot(CITIES, aes(factor(year),Emissions,fill=city)) + 
  geom_bar(stat="identity",aes(fill=year)) +
  facet_grid(.~city) +
  guides(fill=FALSE) +
  theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggpbv2)

dev.off()