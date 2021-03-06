library(ggplot2)

cat('Usage: boxplotWaste(vmSize="twenty", containerSize=1000) \n')
boxplotWaste <- function(vmSize, containerSize){
	base <- "../"
	run <- 40
	alg1 <- "ffBfFF"
	alg2 <- "cecGA"
	alg3 <- "dualPermutationNF"
	alg4 <- "dualPermutationFF"
	alg5 <- "groupGA"

	alg1Path <- paste(base, alg1, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg2Path <- paste(base, alg2, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg3Path <- paste(base, alg3, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg4Path <- paste(base, alg4, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg5Path <- paste(base, alg5, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')

	alg1data <- unlist(read.table(alg1Path))

	# repeat the deterministic results
	alg1data <- rep(alg1data, run)
	alg2data <- unlist(read.table(alg2Path))
	alg3data <- unlist(read.table(alg3Path))
	alg4data <- unlist(read.table(alg4Path))
	alg5data <- unlist(read.table(alg5Path))

	alg1data <- cbind(alg1data, "FF&BF/FF")
	alg2data <- cbind(alg2data, "SGA")
	alg3data <- cbind(alg3data, "DGA-NF")
	alg4data <- cbind(alg4data, "DGA-FF")
	alg5data <- cbind(alg5data, "GGA")
#
	colnames(alg1data) <- c("wastedResource", "algorithm")
	colnames(alg2data) <- c("wastedResource", "algorithm")
	colnames(alg3data) <- c("wastedResource", "algorithm")
	colnames(alg4data) <- c("wastedResource", "algorithm")
	colnames(alg5data) <- c("wastedResource", "algorithm")
#
	alg1data <- data.frame(alg1data)
	alg2data <- data.frame(alg2data)
	alg3data <- data.frame(alg3data)
	alg4data <- data.frame(alg4data)
	alg5data <- data.frame(alg5data)

	alg1data$wastedResource <- as.numeric(as.character(alg1data$wastedResource))
	alg2data$wastedResource <- as.numeric(as.character(alg2data$wastedResource))
	alg3data$wastedResource <- as.numeric(as.character(alg3data$wastedResource))
	alg4data$wastedResource <- as.numeric(as.character(alg4data$wastedResource))
	alg5data$wastedResource <- as.numeric(as.character(alg5data$wastedResource))

	data <- rbind(alg1data, alg2data, alg3data, alg4data, alg5data)
	data$algorithm <- factor(data$algorithm, levels=c("FF&BF/FF", "SGA", "DGA-NF", "DGA-FF", "GGA"))
#
	p <- ggplot(data, aes(x=algorithm, y=wastedResource, fill=algorithm)) + 
		geom_boxplot(show.legend=F) + 
		geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) + 
		scale_fill_brewer(palette="Set1") + 
		xlab("Algorithm") + 
		ylab("Wasted resources") + 
		theme(legend.position = "none", 
		axis.text = element_text(size = 35, face = "bold"), 
		axis.title = element_text(size = 35, face = "bold"))
	p
	ggsave(paste("../waste/",vmSize, "_",containerSize, "_waste.png" ,sep=''), height=10, width=15)
	ggsave(paste("../waste/",vmSize, "_",containerSize, "_waste.eps" ,sep=''), height=10, width=15)
	ggsave(paste("../waste/",vmSize, "_",containerSize, "_waste.svg" ,sep=''), height=10, width=15)
}
