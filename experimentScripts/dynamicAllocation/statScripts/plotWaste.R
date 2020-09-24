library(ggplot2)
library(scales)

cat('Usage: plotWaste(base, testCase, testCaseSize, waste=CPU|Overhead)\n')
plotWaste <- function(base, testCase, testCaseSize, waste="CPU"){
	yaxis <- ''
	if(waste=="CPU" || waste == "CPUOverhead"){
		yaxis <- 'CPU (MHz)'
	} else {
		yaxis <- 'Memory (MBs)'
	}
	wasteFile <- paste("/wasted", waste, ".csv", sep='')
	justfitWastePath <- paste(base, "justFitSub/", testCase, wasteFile, sep = '')

	evoTwoLevels <- list()
	for(i in seq(0, 29)){
	
		evoPath <- paste(base, 'evoTwoLevels/evo', i, '/', testCase, wasteFile, sep='')
		evoData <- unlist(read.csv(evoPath, header=F))
		evoTwoLevels[[i+1]] <- evoData
	}
	evoTwoSum <- evoTwoLevels[[1]]
	for(i in seq(2, 30)){
		evoTwoSum <- evoTwoSum + evoTwoLevels[[i]]
	}
	evoTwoWaste <- evoTwoSum / 30

	evoOneLevel <- list()
	for(i in seq(0, 29)){
	
		evoPath <- paste(base, 'evoContainerLevel/evo', i, '/', testCase, wasteFile, sep='')
		evoData <- unlist(read.csv(evoPath, header=F))
		evoOneLevel[[i+1]] <- evoData
	}

	evoOneSum <- evoOneLevel[[1]]
	for(i in seq(2, 30)){
		evoOneSum <- evoOneSum + evoOneLevel[[i]]
	}
	evoOneWaste <- evoOneSum / 30

	#largestWaste <- unlist(read.csv(largestWastePath, header=F))
	justfitWaste <- unlist(read.csv(justfitWastePath, header=F))

	minimum <- min(c(evoOneWaste, justfitWaste, evoTwoWaste))
	maximum <- max(c(evoOneWaste, justfitWaste, evoTwoWaste))

	mark <- rep(seq(1, testCaseSize), 3)
	labels <- c(rep('aaaaaaaaaaaaa', testCaseSize), rep('bbbbbbbb', testCaseSize), rep('cccccccc', testCaseSize))
	data <- data.frame(label=labels, mark=mark, waste=c(justfitWaste, evoOneWaste, evoTwoWaste))

	p <- ggplot(data=data, aes(x=mark, y=waste, fill=label)) + geom_line(aes(col=label), size=1) + scale_color_manual(values=c('#fa9d22', '#86b3dd', '#812c2c')) + 
		labs(x="Container", y=yaxis) + 
		#ylim(8, 9.5) + xlim(900, 2500) + 
		theme(panel.background = element_rect(fill='#eaeaea'), panel.grid.minor=element_line(color='#bdbdbd'), panel.grid.major=element_line(color='#bdbdbd'), plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(size=50, hjust = 0.5, face="bold"), axis.text.x = element_text(size=40), axis.text.y=element_text(size=40, angle=90), legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=40))
		#theme(panel.background = element_rect(fill='#444B5A'), panel.grid.minor=element_line(color='#4d5566'), panel.grid.major=element_line(color='#586174'),  plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(hjust=0.5, face="bold"), axis.text.x=element_text(size=30), axis.text.y=element_text(size=30, angle=90), legend.position=c(0.3, 0.8), legend.title=element_blank(), legend.text=element_text(size=40)) + xlim(750, 2500)
	#+ scale_y_continuous(labels=scientific)
	p

	#print(data)
	#p <- ggplot(data=data, aes(x=mark, y=waste, group=label)) + geom_line(aes(color=label), size=1) + scale_color_brewer(palette="Set1", labels=c("sub&Just-Fit/FF", "evo/FF", "evo/evo")) + theme(legend.position=c(0.18,0.85), axis.text=element_text(size=30, face="bold"), axis.title=element_text(size=30, face="bold"), legend.text=element_text(size=40, face="bold")) + xlab("containers") + ylab(yaxis) + scale_x_continuous(breaks=c(0,testCaseSize/4, testCaseSize/2, (testCaseSize*3/4),testCaseSize)) + scale_y_continuous(breaks=c(0, maximum/4, maximum/2, maximum*3/4,maximum), labels=scientific)
#+ geom_point(aes(color=label)) 
	p
	ggsave(paste(base, "/wasted", waste, "_testCase", testCase, ".png", sep=''), height=10, width=15)
	ggsave(paste(base, "/wasted", waste, "_testCase", testCase, ".eps", sep=''), height=10, width=15)
}
