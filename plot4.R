#Plot 4

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png(filename='plot4.png', width=480, height=480, units='px')


ggpcombustion <- ggplot(combustionNEI, aes(factor(year),Emissions/10^5)) + 
                geom_bar(stat="identity",width=0.75, fill="grey") +
                guides(fill=FALSE) +
                theme_bw() +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
                labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggpcombustion)

dev.off()