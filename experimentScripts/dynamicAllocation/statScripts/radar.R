library(ggradar)
library(ggplot2)
library(dplyr)
library(tibble)

radar <- function(base, vmNo){
	vmDistFile <- paste(base, 'vmDist.csv', sep='')
	#rawData <- t(read.csv(vmDistFile, header=T, sep=',') * 100)
	rawData <- read.csv(vmDistFile, header=T, sep=',') * 100
	colnames(rawData) <- c("evo/evo", "evo/FF", "sub&JustFit/FF")
	rawData <- t(rawData)
	colnames(rawData) <- seq(1, vmNo)
	#algorithm <- c(rep("X", vmNo), rep("Y", vmNo), rep("Z", vmNo))
	#vmDist <- c(rawData[, 3], rawData[, 2], rawData[, 1])
	#x_axis <- seq(1, vmNo)
	#data <- data.frame(x = x_axis, y = vmDist, algorithm)
	#print(rawData)
	rawData <- rawData %>% as_tibble(rownames="group")

	ggradar(rawData, grid.max=90, font.radar="", legend.position="bottom",legend.text.size = 40, group.point.size=2, axis.label.size = 10, group.colours=c("#ff007f", "#00aaff", "#f7b201"), group.line.width=1.5,grid.label.size = 10, values.radar = c("0", "10%", "100%"))

	ggsave(paste(base, "/radar", vmNo, ".png", sep=''), height=10, width=10)
	ggsave(paste(base, "/radar", vmNo, ".eps", sep=''), height=10, width=10)
}
