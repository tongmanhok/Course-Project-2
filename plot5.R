#Plot 5
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

NEI_baltimore_V <- subset(vehiclesNEI,fips=="24510")

png(filename='plot5.png', width=480, height=480, units='px')

ggpbv <- ggplot(NEI_baltimore_V, aes(factor(year),Emissions/10^5)) + 
  geom_bar(stat="identity",width=0.75, fill="grey") +
  guides(fill=FALSE) +
  theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggpbv)

dev.off()
