library(ggplot2)
aveEnergyBoxplot <- function(testCase = 1){
	run <- 30
	vmTypeList <- c("five", "seven", "ten")
	testCaseList <- c("Container100", "Container200", "Container500", "Container1000")
	base <- "/local/scratch/tanboxi/staticContainerAllocation/"


	noOfVm <- 1
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")

	cecEnergyFive <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergyFive <- cecEnergyFive[1]
	cecSdEnergyFive <- cecEnergyFive[2]

	dualPermutationEnergyFive <- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergyFive <- dualPermutationEnergyFive[1]
	dualSdEnergyFive <- dualPermutationEnergyFive[2]


	bestEnergyFive <- unlist(read.csv(bestFitEnergyPath, header=F, sep=','))
	bestAveEnergyFive <- bestEnergyFive[1]
	bestSdEnergyFive <- 0


	noOfVm <- 2
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")

	cecEnergySeven <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergySeven <- cecEnergySeven[1]
	cecSdEnergySeven <- cecEnergySeven[2]

	dualPermutationEnergySeven <- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergySeven <- dualPermutationEnergySeven[1]
	dualSdEnergySeven <- dualPermutationEnergySeven[2]

	bestAveEnergySeven <- bestEnergyFive
	bestSdEnergySeven <- 0

	noOfVm <- 3
	cecEnergyPath <- paste(base, "cecGA/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	dualPermutationEnergyPath <- paste(base, "dualPermutation/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")
	bestFitEnergyPath <- paste(base, "bestFitDescending/", vmTypeList[noOfVm], "/", testCaseList[testCase], "/aveEnergy.csv", sep="")

	cecEnergyTen <- unlist(read.csv(cecEnergyPath, header=F, sep=','))
	cecAveEnergyTen <- cecEnergyTen[1]
	cecSdEnergyTen <- cecEnergyTen[2]

	dualPermutationEnergyTen <- unlist(read.csv(dualPermutationEnergyPath, header=F, sep=','))
	dualAveEnergyTen <- dualPermutationEnergyTen[1]
	dualSdEnergyTen <- dualPermutationEnergyTen[2]

	bestAveEnergyTen <- bestAveEnergyFive
	bestSdEnergyTen <- 0


	aveEnergy <- c(cecAveEnergyFive, cecAveEnergySeven, cecAveEnergyTen, dualAveEnergyFive, dualAveEnergySeven, dualAveEnergyTen, rep(bestAveEnergyFive, 3))
	sdEnergy <- c(cecSdEnergyFive, cecSdEnergySeven, cecSdEnergyTen, dualSdEnergyFive, dualSdEnergySeven, dualSdEnergyTen, bestSdEnergyFive, bestSdEnergySeven, bestSdEnergyTen)


	algorithm <- c(rep("single chromosome GA", 3), rep("dual chromosome GA", 3), rep("BestFit Descending", 3))
	noOfVms <- rep(c("x", "y", "z"), 3)

	minimum <- min(aveEnergy)
	maximum <- max(aveEnergy)
	data <- data.frame(aveEnergy, noOfVms, sdEnergy)

	p <- ggplot(data, aes(x=noOfVms, y=aveEnergy, group=algorithm, color=algorithm)) + geom_errorbar(aes(ymin=aveEnergy - sdEnergy, ymax=aveEnergy + sdEnergy), width=.1, position=position_dodge(0.1)) + geom_line(size=1.5, position=position_dodge(0.1)) + scale_x_discrete(labels=c("5", "7", "10"))+ geom_point(position=position_dodge(0.1), size=2) + scale_color_brewer(palette="Set1") + ylim(minimum-50, maximum+50) + xlab("Number of VM types") + ylab("Average Energy (Kwh)") + theme(axis.text = element_text(size = 40, face="bold"), legend.text = element_text(size=22, face="bold"), legend.title=element_text(""), axis.title=element_text(size=35, face="bold"), legend.position=c(0.4, 0.8))
	p
	ggsave("../energyCompare.png")
	ggsave("../energyCompare.eps")
	ggsave("../energyCompare.pdf")

}



