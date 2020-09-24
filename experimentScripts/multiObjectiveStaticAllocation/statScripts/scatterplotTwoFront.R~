library(ggplot2)
library(nsga2R)

cat("Usage: scatterplotTwoFront(vmSize='ten', appSize=150) \n")

source('medianHv.R')
scatterplotTwoFront <- function(vmSize='ten', appSize=150){



	base <- "/local/scratch/tanboxi/multiObjContainerAllocation/"
	medianHvGroupGARun <- medianHv('multiGroupGA',  vmSize, appSize)
	medianHvDualFFRun <- medianHv('multiDualFF', vmSize, appSize)


	multiGroupGAPath <- paste(base, "multiGroupGA/", vmSize, '/app', appSize, "/", medianHvGroupGARun, "/paretoFront.csv", sep='')
	dualPath <- paste(base, 'multiDualFF/', vmSize, "/app", appSize, "/", medianHvDualFFRun, "/paretoFront.csv", sep = '')


	multiGroupGA <- read.csv(multiGroupGAPath, header=F, sep=',')[, 1:2]
	dual <- read.csv(dualPath, header=F, sep=',')[, 1:2]
	print(dual)


	multiGroupGA <- cbind(multiGroupGA, "NS-GGA")
	dual <- cbind(dual, "NS-DGA-FF")

	colnames(multiGroupGA) <- c("energy", "failure", "algorithm")
	colnames(dual) <- c('energy', 'failure', 'algorithm')

	#data <- rbind(ffBfFF, spread, dual, bestMultiGroupGA)
	data <- rbind(dual, multiGroupGA)
	p <- ggplot(data, aes(x=energy, y=failure, fill=algorithm)) +
		geom_point(size=6, shape=21, stroke=1) +
		scale_fill_brewer(palette="Set1") +
		xlab("Energy (kwh)") +
		ylab("Failure") +
		theme(legend.position="bottom", 
		legend.text = element_text(size=35, face="bold"),
		legend.title = element_blank(),
		axis.text = element_text(size=30, face="bold"), 
		axis.title = element_text(size=30, face="bold"))
		p

		ggsave(paste("../paretoFront/multi/", vmSize, "_app", appSize, ".png", sep=''), height=10, width=15)
		ggsave(paste("../paretoFront/multi/", vmSize, "_app", appSize, ".eps", sep=''), height=10, width=15)

	

}
