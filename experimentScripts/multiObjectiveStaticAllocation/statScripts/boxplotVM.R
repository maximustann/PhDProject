library(ggplot2)

cat('Usage: boxplotVM(vmSize="twenty", containerSize=1000) \n')
boxplotVM<- function(vmSize, containerSize){
	base <- "../"
	run <- 40
	alg1 <- "ffBfFF"
	alg2 <- "dualPermutationNF"
	alg3 <- "dualPermutationFF"
	alg4 <- "groupGA"

	alg1Path <- paste(base, alg1, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg2Path <- paste(base, alg2, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg3Path <- paste(base, alg3, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg4Path <- paste(base, alg4, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')

	alg1data <- read.table(alg1Path, sep=',')[, 1]

	# repeat the deterministic results
	alg1data <- rep(alg1data, run)
	alg2data <- read.table(alg2Path, sep=',')[, 1]
	alg3data <- read.table(alg3Path, sep=',')[, 1]
	alg4data <- read.table(alg4Path, sep=',')[, 1]

	alg1data <- cbind(alg1data, "FF&BF/FF")
	alg2data <- cbind(alg2data, "DGA-NF")
	alg3data <- cbind(alg3data, "DGA-FF")
	alg4data <- cbind(alg4data, "GGA")

	colnames(alg1data) <- c("numOfVm", "algorithm")
	colnames(alg2data) <- c("numOfVm", "algorithm")
	colnames(alg3data) <- c("numOfVm", "algorithm")
	colnames(alg4data) <- c("numOfVm", "algorithm")

	alg1data <- data.frame(alg1data)
	alg2data <- data.frame(alg2data)
	alg3data <- data.frame(alg3data)
	alg4data <- data.frame(alg4data)

	alg1data$numOfVm <- as.numeric(as.character(alg1data$numOfVm))
	alg2data$numOfVm <- as.numeric(as.character(alg2data$numOfVm))
	alg3data$numOfVm <- as.numeric(as.character(alg3data$numOfVm))
	alg4data$numOfVm <- as.numeric(as.character(alg4data$numOfVm))
	data <- rbind(alg1data, alg2data, alg3data, alg4data)

	p <- ggplot(data, aes(x=algorithm, y=numOfVm, fill=algorithm)) + 
		geom_boxplot() + 
		geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=4) + 
		scale_fill_brewer(palette="Set1") + 
		xlab("Algorithm") + 
		ylab("Number of VMs") + 
		theme(legend.position="none", 
		axis.text = element_text(size = 35, face = "bold"), 
		axis.title = element_text(size = 35, face = "bold"))
	p

	ggsave(paste("../",vmSize, "_",containerSize, "_vm.png" ,sep=''), height=10, width=15)
	ggsave(paste("../",vmSize, "_",containerSize, "_vm.eps" ,sep=''), height=10, width=15)

}
