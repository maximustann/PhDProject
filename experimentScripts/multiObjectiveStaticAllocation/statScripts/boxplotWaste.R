library(ggplot2)

cat('Usage: boxplotWaste(vmSize="twenty", appSize=50) \n')
boxplotWaste <- function(vmSize, containerSize){
	base <- "../"
	run <- 40
	alg1 <- "ffBfFF"
	alg2 <- "Spread"
	alg3 <- "dual"
	alg4 <- "multiGroupGA"

	alg1Path <- paste(base, alg1, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg2Path <- paste(base, alg2, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg3Path <- paste(base, alg3, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')
	alg4Path <- paste(base, alg4, '/', vmSize, "/Container", containerSize, "/wastedResource.csv", sep='')

	alg1data <- unlist(read.table(alg1Path))

	# repeat the deterministic results
	alg1data <- rep(alg1data, run)


	alg2data <- unlist(read.table(alg2Path))
	alg3data <- unlist(read.table(alg3Path))
	alg4data <- unlist(read.table(alg4Path))

	alg1data <- cbind(alg1data, "FF&BF/FF")
	alg2data <- cbind(alg2data, "DGA-NF")
	alg3data <- cbind(alg3data, "DGA-FF")
	alg4data <- cbind(alg4data, "GGA")
#
	colnames(alg1data) <- c("wastedResource", "algorithm")
	colnames(alg2data) <- c("wastedResource", "algorithm")
	colnames(alg3data) <- c("wastedResource", "algorithm")
	colnames(alg4data) <- c("wastedResource", "algorithm")
#
	alg1data <- data.frame(alg1data)
	alg2data <- data.frame(alg2data)
	alg3data <- data.frame(alg3data)
	alg4data <- data.frame(alg4data)

	alg1data$wastedResource <- as.numeric(as.character(alg1data$wastedResource))
	alg2data$wastedResource <- as.numeric(as.character(alg2data$wastedResource))
	alg3data$wastedResource <- as.numeric(as.character(alg3data$wastedResource))
	alg4data$wastedResource <- as.numeric(as.character(alg4data$wastedResource))
	data <- rbind(alg1data, alg2data, alg3data, alg4data)
	data$algorithm <- factor(data$algorithm, levels=c("FF&BF/FF", "DGA-NF", "DGA-FF", "GGA"))
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
	ggsave(paste("../",vmSize, "_",containerSize, "_waste.png" ,sep=''), height=10, width=15)
	ggsave(paste("../",vmSize, "_",containerSize, "_waste.eps" ,sep=''), height=10, width=15)
}
