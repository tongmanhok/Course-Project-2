#Loading Data
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dim(NEI)
head(NEI)
str(NEI)

dim(SCC)
head(SCC)
str(SCC)