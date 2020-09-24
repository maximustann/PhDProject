library(ggplot2)
avePmBoxplot <- function(noOfVm = 1){
	run <- 30
	vmTypeList <- c("five", "seven", "ten")
	testCaseList <- c("Container100", "Container200", "Container500", "Container1000")
	base <- "/local/scratch/tanboxi/staticContainerAllocation/"


	testCase <- 1
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")

	cecEnergy1 <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergy1<- cecEnergy1[1]
	cecSdEnergy1<- cecEnergy1[2]

	dualPermutationEnergy1<- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergy1<- dualPermutationEnergy1[1]
	dualSdEnergy1<- dualPermutationEnergy1[2]


	bestEnergy1<- unlist(read.csv(bestFitEnergyPath, header=F, sep=','))
	bestAveEnergy1<- bestEnergy1[1]
	bestSdEnergy1<- 0


	testCase <- 2
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")

	cecEnergy2 <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergy2<- cecEnergy2[1]
	cecSdEnergy2<- cecEnergy2[2]

	dualPermutationEnergy2<- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergy2<- dualPermutationEnergy2[1]
	dualSdEnergy2<- dualPermutationEnergy2[2]


	bestEnergy2<- unlist(read.csv(bestFitEnergyPath, header=F, sep=','))
	bestAveEnergy2<- bestEnergy2[1]
	bestSdEnergy2<- 0

	testCase <- 3
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")

	cecEnergy3 <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergy3<- cecEnergy3[1]
	cecSdEnergy3<- cecEnergy3[2]

	dualPermutationEnergy3<- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergy3<- dualPermutationEnergy3[1]
	dualSdEnergy3<- dualPermutationEnergy3[2]


	bestEnergy3<- unlist(read.csv(bestFitEnergyPath, header=F, sep=','))
	bestAveEnergy3<- bestEnergy3[1]
	bestSdEnergy3<- 0




	testCase <- 4
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveNumOfPm.csv", sep="")

	cecEnergy4 <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergy4<- cecEnergy4[1]
	cecSdEnergy4<- cecEnergy4[2]

	dualPermutationEnergy4<- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergy4<- dualPermutationEnergy4[1]
	dualSdEnergy4<- dualPermutationEnergy4[2]


	bestEnergy4<- unlist(read.csv(bestFitEnergyPath, header=F, sep=','))
	bestAveEnergy4<- bestEnergy4[1]
	bestSdEnergy4 <- 0


	avePm <- c(cecAveEnergy1, cecAveEnergy2, cecAveEnergy3, cecAveEnergy4, dualAveEnergy1, dualAveEnergy2, dualAveEnergy3, dualAveEnergy4, bestAveEnergy1, bestAveEnergy2, bestAveEnergy3, bestAveEnergy4)
	sdPm <- c(cecSdEnergy1, cecSdEnergy2, cecSdEnergy3, cecSdEnergy4, dualSdEnergy1, dualSdEnergy2, dualSdEnergy3, dualSdEnergy4, bestSdEnergy1, bestSdEnergy2, bestSdEnergy3, bestSdEnergy4)


	algorithm <- c(rep("single chromosome GA", 4), rep("dual chromosome GA", 4), rep("BestFit Descending", 4))
	#noOfVms <- rep(c("Five", "Seven", "Ten"), 3)
	testCases <- rep(c(1, 2, 3, 4), 3)

	minimum <- min(avePm)
	maximum <- max(avePm)
	data <- data.frame(avePm, testCases, sdPm)

	p <- ggplot(data, aes(x=testCases, y=avePm, group=algorithm, color=algorithm)) + geom_errorbar(aes(ymin=avePm - sdPm, ymax=avePm+ sdPm), width=.1, position=position_dodge(0.1)) + geom_line(size=1.5, position=position_dodge(0.1)) + scale_y_continuous(breaks=seq(0, maximum, by=10))+ geom_point(position=position_dodge(0.1), size=2) + scale_color_brewer(palette="Set2") + xlab("test instance") + ylab("Average number of PMs") + theme(axis.text = element_text(size = 40, face="bold"), legend.text = element_text(size=25, face="bold"), legend.title=element_text(""), axis.title=element_text(size=30, face="bold"), legend.position=c(0.4, 0.8))
	p
	ggsave("../pmCompare.png")
	ggsave("../pmCompare.eps")
	ggsave("../pmCompare.pdf")

}



