library(ggplot2)
library(reshape2)
aveVm <- function(vmType='ten'){

	readTestCase <- function(vmType, testcase){
		run <- 30
		testcaseName <- paste('app', testcase, sep='')
		base <- "/local/scratch/tanboxi/multiObjContainerAllocation/"
		fileName <- "numOfVm.csv"

		vmNum <- 0
		for(i in seq(run)){
			dual <- unlist(read.csv(paste(base, 'multiDualFF/', vmType, '/', testcaseName, '/', i, '/', fileName, sep=''), header=F, sep=','))[1]
			vmNum <- dual + vmNum
		}
		dualVmNum <- ceiling(vmNum / run)

		vmNum <- 0
		for(i in seq(run)){
			multiGroupGA <- unlist(read.csv(paste(base, 'multiGroupGA/', vmType, '/', testcaseName, '/', i, '/', fileName, sep=''), header=F, sep=','))[1]
			vmNum <- multiGroupGA + vmNum
		}
		multiGroupGAVmNum <- ceiling(vmNum / run)

		ffbfffVmNum <- read.csv(paste(base, 'ffBfFF/', vmType, '/', testcaseName, '/',  fileName, sep=''), header=F, sep=',')$V1
		spreadVmNum <- read.csv(paste(base, 'Spread/', vmType, '/', testcaseName, '/',  fileName, sep=''), header=F, sep=',')$V1
		vmNum <- c(ffbfffVmNum, spreadVmNum, dualVmNum, multiGroupGAVmNum)
		algorithm <- c('a', 'b', 'c', 'd')
		testcaseName <- rep(testcase, 4)
		data <- data.frame(vmNum=vmNum, algorithm=algorithm, testcase=testcaseName)
		data
	}

	testcase200 <- readTestCase(vmType, 200)
	testcase150 <- readTestCase(vmType, 150)
	testcase100 <- readTestCase(vmType, 100)
	testcase50 <- readTestCase(vmType, 50)



	#algorithm <- c(rep("single chromosome GA", 3), rep("dual chromosome GA", 3), rep("BestFit Descending", 3))
	#noOfVms <- rep(c("Five", "Seven", "Ten"), 3)

	#minimum <- min(aveEnergy)
	#maximum <- max(aveEnergy)
	
	data <- rbind(testcase50, testcase100, testcase150, testcase200)
	#data[, 2] <- factor(data[, 2], levels=c('FF&BF/FF', 'Spread', 'dual-chromosome GA', 'NSGAII'))
	#data$vmNum <- as.integer(data$vmNum)
	print(data)

	p <- ggplot(data, aes(x=testcase, y=vmNum)) + 
	geom_bar(
		stat="identity", 
		width = 10, 
		aes(fill=algorithm), 
		position=position_dodge()) + 
	#scale_x_discrete(=c("50", "100", "150", "200")) + 
	scale_fill_brewer(palette="Set1", labels=c('FF&BF/FF', 'Spread', 'NS-DGA-FF', 'NS-GGA')) + 
	xlab("Number of applications") + 
	ylab("Number of VMs") + 
	theme(
		  axis.text = element_text(size = 20, face="bold"), 
		  legend.text = element_text(size=20, face="bold"), 
		  legend.title= element_blank(),
		  axis.title=element_text(size=20, face="bold"), 
		  legend.position="bottom"
	)
	
	p
	ggsave(paste("../", vmType, "_noVM.png", sep=''), height=10, width=10)
	ggsave(paste("../", vmType, "_noVM.eps", sep=''), height=10, width=10)

}



