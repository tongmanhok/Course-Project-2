#Plot 2

NEI_baltimore <- subset(NEI,fips=="24510")
agg_baltimore <- aggregate(Emissions ~ year,NEI_baltimore, sum)

png(filename='plot2.png', width=480, height=480, units='px')

barplot(
  (agg_baltimore$Emissions)/10^6,
  names.arg=agg_baltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.off()
