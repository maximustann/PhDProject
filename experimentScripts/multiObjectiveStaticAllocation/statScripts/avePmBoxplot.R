library(ggplot2)
cat("Usage: avePmBoxplot(vmSize='ten', appSize=150)")
avePmBoxplot <- function(vmSize='ten', appSize=150){
	run <- 30
	base <- "/local/scratch/tanboxi/multiObjContainerAllocation/"
	
	ffBfFfPath <- paste(base, 'ffBfFF', vmSize, '/app', appSize, "/aveNumOfPm.csv", sep='')
	multiGroupGaPmNum <- 0

	for(i in seq(run)){
		multiGroupGaPath <- paste(base, "multiGrouGA/", vmSize, "/app", appSize, "/", run, "/numOfPm.csv" sep='')
		data <- read.csv(multiGroupGaPath, header=F, sep='')
		multiGroupGaPmNum <- multiGroupGaPmNum + data[1, 1]
	}

	multiGroupGaPmNum <- multiGroupGaPmNum / run
	ffBfFF <- read.csv(ffBfFfPath, header=F, sep='')[1, 1]


	#avePm <- c(cecAveEnergy1, cecAveEnergy2, cecAveEnergy3, cecAveEnergy4, dualAveEnergy1, dualAveEnergy2, dualAveEnergy3, dualAveEnergy4, bestAveEnergy1, bestAveEnergy2, bestAveEnergy3, bestAveEnergy4)
	#sdPm <- c(cecSdEnergy1, cecSdEnergy2, cecSdEnergy3, cecSdEnergy4, dualSdEnergy1, dualSdEnergy2, dualSdEnergy3, dualSdEnergy4, bestSdEnergy1, bestSdEnergy2, bestSdEnergy3, bestSdEnergy4)


	#algorithm <- c(rep("single chromosome GA", 4), rep("dual chromosome GA", 4), rep("BestFit Descending", 4))
	#noOfVms <- rep(c("Five", "Seven", "Ten"), 3)
	#testCases <- rep(c(1, 2, 3, 4), 3)

	minimum <- min(avePm)
	maximum <- max(avePm)
	data <- data.frame(avePm, testCases, sdPm)

	p <- ggplot(data, aes(x=testCases, y=avePm, group=algorithm, color=algorithm)) + geom_errorbar(aes(ymin=avePm - sdPm, ymax=avePm+ sdPm), width=.1, position=position_dodge(0.1)) + geom_line(size=1.5, position=position_dodge(0.1)) + scale_y_continuous(breaks=seq(0, maximum, by=10))+ geom_point(position=position_dodge(0.1), size=2) + scale_color_brewer(palette="Set2") + xlab("test instance") + ylab("Average number of PMs") + theme(axis.text = element_text(size = 40, face="bold"), legend.text = element_text(size=25, face="bold"), legend.title=element_text(""), axis.title=element_text(size=30, face="bold"), legend.position=c(0.4, 0.8))
	p
	ggsave("../pmCompare.png")
	ggsave("../pmCompare.eps")
	ggsave("../pmCompare.pdf")

}



