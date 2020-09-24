library(ggplot2)

cat('Usage: boxplotVM(vmSize="twenty", containerSize=1000) \n')
boxplotVM<- function(vmSize, containerSize){
	base <- "../"
	run <- 40
	alg1 <- "ffBfFF"
	alg2 <- "cecGA"
	alg3 <- "dualPermutationNF"
	alg4 <- "dualPermutationFF"
	alg5 <- "groupGA"

	alg1Path <- paste(base, alg1, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg2Path <- paste(base, alg2, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg3Path <- paste(base, alg3, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg4Path <- paste(base, alg4, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')
	alg5Path <- paste(base, alg5, '/', vmSize, "/Container", containerSize, "/numOfVm.csv", sep='')

	alg1data <- read.table(alg1Path, sep=',')[, 1]

	# repeat the deterministic results
	alg1data <- rep(alg1data, run)
	alg2data <- read.table(alg2Path, sep=',')[, 1]
	alg3data <- read.table(alg3Path, sep=',')[, 1]
	alg4data <- read.table(alg4Path, sep=',')[, 1]
	alg5data <- read.table(alg5Path, sep=',')[, 1]

	alg1data <- cbind(alg1data, "FF&BF/FF")
	alg2data <- cbind(alg2data, "SGA")
	alg3data <- cbind(alg3data, "DGA-NF")
	alg4data <- cbind(alg4data, "DGA-FF")
	alg5data <- cbind(alg5data, "GGA-RAC")

	colnames(alg1data) <- c("numOfVm", "algorithm")
	colnames(alg2data) <- c("numOfVm", "algorithm")
	colnames(alg3data) <- c("numOfVm", "algorithm")
	colnames(alg4data) <- c("numOfVm", "algorithm")
	colnames(alg5data) <- c("numOfVm", "algorithm")

	alg1data <- data.frame(alg1data)
	alg2data <- data.frame(alg2data)
	alg3data <- data.frame(alg3data)
	alg4data <- data.frame(alg4data)
	alg5data <- data.frame(alg5data)

	alg1data$numOfVm <- as.numeric(as.character(alg1data$numOfVm))
	alg2data$numOfVm <- as.numeric(as.character(alg2data$numOfVm))
	alg3data$numOfVm <- as.numeric(as.character(alg3data$numOfVm))
	alg4data$numOfVm <- as.numeric(as.character(alg4data$numOfVm))
	alg5data$numOfVm <- as.numeric(as.character(alg5data$numOfVm))
	data <- rbind(alg1data, alg2data, alg3data, alg4data, alg5data)

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

	ggsave(paste("../numberOfVM/",vmSize, "_",containerSize, "_vm.png" ,sep=''), height=10, width=15)
	ggsave(paste("../numberOfVM/",vmSize, "_",containerSize, "_vm.eps" ,sep=''), height=10, width=15)
	ggsave(paste("../numberOfVM/",vmSize, "_",containerSize, "_vm.svg" ,sep=''), height=10, width=15)

}
