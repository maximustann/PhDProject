library(ggplot2)
library(scales)

cat('Usage: convergence(vmSize, containerSize, lbound, ubound, second)\n')
convergence <- function(vmSize, containerSize, lbound, ubound, second){
	
	gen <- 1000
	

	base <- "/local/scratch/tanboxi/staticContainerAllocation/"
	#alg1 <- "ffBfFF"
	alg2 <- "cecGA"
	alg3 <- "dualPermutationNF"
	#alg3 <- "dualPermutationNFFFD"
	alg4 <- "dualPermutationFF"
	alg5 <- "groupGA"

	#alg1Path <- paste(base, alg1, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")
	alg2Path <- paste(base, alg2, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")
	alg3Path <- paste(base, alg3, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")
	#alg3Path <- paste(base, alg3, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")
	alg4Path <- paste(base, alg4, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")
	alg5Path <- paste(base, alg5, "/", vmSize, "/Container", containerSize, "/convergence.csv", sep="")


	#alg1Data <- read.table(alg1Path, sep=',', header=F)
	alg2Data <- read.table(alg2Path, sep=',', header=F)
	alg3Data <- read.table(alg3Path, sep=',', header=F)
	#alg3Data <- read.table(alg3Path, sep=',', header=F)[1:325, ]
	alg4Data <- read.table(alg4Path, sep=',', header=F)
	alg5Data <- read.table(alg5Path, sep=',', header=F)


	#alg1Name <- data.frame(algorithm = rep("FF&BF/FF", nrow(alg1Data)))
	alg2Name <- data.frame(algorithm = rep("SGA", nrow(alg2Data)))
	alg3Name <- data.frame(algorithm = rep("DGA-NF", nrow(alg3Data)))
	#alg3Name <- data.frame(algorithm = rep("DGA-NF_FF", nrow(alg3Data)))
	alg4Name <- data.frame(algorithm = rep("DGA-FF", nrow(alg4Data)))
	alg5Name <- data.frame(algorithm = rep("GGA", nrow(alg5Data)))

	#alg1Data <- cbind(alg5Data[, 1], alg1Data, alg1Name)
	alg2Data <- cbind(alg2Data, alg2Name)
	alg3Data <- cbind(alg3Data, alg3Name)
	#alg3Data <- cbind(alg3Data, alg3Name)
	alg4Data <- cbind(alg4Data, alg4Name)
	alg5Data <- cbind(alg5Data, alg5Name)
	#print(alg3Data)
	#colnames(alg1Data) <- c("time", "energy", "algorithm")
	colnames(alg2Data) <- c("time", "energy", "algorithm")
	colnames(alg3Data) <- c("time", "energy", "algorithm")
	#colnames(alg3Data) <- c("time", "energy", "algorithm")
	colnames(alg4Data) <- c("time", "energy", "algorithm")
	colnames(alg5Data) <- c("time", "energy", "algorithm")
	#print(nrow(alg1Data))
	#print(nrow(alg2Data))
	#print(nrow(alg3Data))
	#print(nrow(alg4Data))

	#data <- rbind(alg1Data, alg2Data, alg3Data, alg4Data, alg5Data)
	data <- rbind(alg2Data, alg3Data, alg4Data, alg5Data)
	#print(head(data, 2000))
	#print(data)


	p <- ggplot(data, aes(x=time, y=energy, color=algorithm)) + 
		geom_line(size=2) + 
		scale_color_brewer(palette="Set1") + 
		xlab("Time(s)") + 
		ylab("Energy(Kwh)") + 
		xlim(0, second) + 
		ylim(lbound, ubound) + 
		#coord_cartesian(ylim = c(0, 4250)) +
		#coord_trans(y = magnify_trans(intercept = 3750, reducer = 100))+
		#scale_y_continuous(trans="log10", breaks=c(seq(3800, 3900, by = 50), 4250))+
		theme(axis.text = element_text(size=40, face="bold"), 
								   legend.text=element_text(size=45, face="bold"), 
								   legend.title=element_blank(), 
								   axis.title=element_text(size=40, face="bold"), 
								   legend.position="bottom")
	p

	ggsave(paste("../convergenceCurve/",vmSize, "_",containerSize, "_convergence.png" ,sep=''), height=10, width=15)
	ggsave(paste("../convergenceCurve/",vmSize, "_",containerSize, "_convergence.eps" ,sep=''), height=10, width=15)
	ggsave(paste("../convergenceCurve/",vmSize, "_",containerSize, "_convergence.svg" ,sep=''), height=10, width=15)

}
