#Plot 3 
library(ggplot2)
NEI_baltimore <- subset(NEI,fips=="24510")

png(filename='plot3.png', width=480, height=480, units='px')

type_baltimore <- ggplot(NEI_baltimore,aes(factor(year),Emissions,fill=type)) + 
            geom_bar(stat="identity") + 
            guides(fill=FALSE) +
            facet_grid(.~type) + 
            labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
            labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(type_baltimore)

dev.off()