library(ggplot2)
library(scales)
cat("Usage: energyIncreasing(base, run, numOfContainer) \n")

energyIncreasing <- function(base, run, numOfContainer){

	justfitPath <- paste(base, 'justFitSub/', run, '/energy.csv', sep='')
	evoTwoLevels <- list()
	for(i in seq(0, 29)){
		evoPath <- paste(base, 'evoTwoLevels/evo', i, '/', run, '/energy.csv', sep='')
		evoData <- unlist(read.csv(evoPath, header=F))
		evoTwoLevels[[i+1]] <- evoData
	}
	evoTwoSum <- evoTwoLevels[[1]]
	for(i in seq(2, 30)){
		evoTwoSum <- evoTwoSum + evoTwoLevels[[i]]
	}
	evoTwoAverage <- evoTwoSum / 30
	evoTwoAverage <- evoTwoAverage

	evoOneLevel <- list()
	for(i in seq(0, 29)){
	
		evoPath <- paste(base, 'evoContainerLevel/evo', i, '/', run, '/energy.csv', sep='')
		evoData <- unlist(read.csv(evoPath, header=F))
		evoOneLevel[[i+1]] <- evoData
	}

	evoOneSum <- evoOneLevel[[1]]
	for(i in seq(2, 30)){
		evoOneSum <- evoOneSum + evoOneLevel[[i]]
	}
	evoOneAverage <- evoOneSum / 30
	evoOneAverage <- evoOneAverage 
	
	justFitSub <- unlist(read.csv(justfitPath, header=F))
	evoOneAverage <- unlist(evoOneAverage)
	evoTwoAverage <- unlist(evoTwoAverage)

	maximum <- max(c(justFitSub, evoOneAverage, evoTwoAverage))
	minimum <- min(c(justFitSub, evoOneAverage, evoTwoAverage))


	mark <- rep(seq(1, numOfContainer+1), 3)
	labels <- c(rep('x', numOfContainer+1), rep('y', numOfContainer+1), rep('z', numOfContainer+1))
	data <- data.frame(label=labels, mark=mark, SlopeOfIncrement=c(justFitSub, evoOneAverage, evoTwoAverage))

	p <- ggplot(data=data, aes(x=mark, y=SlopeOfIncrement, group=label)) + geom_line(aes(color=label), size=1) + scale_color_brewer(palette="Set1", labels=c("sub&Just-Fit/FF", "evo/FF", "evo/evo")) + theme(legend.position=c(0.2,0.85), axis.text=element_text(size=30, face="bold"), axis.title=element_text(size=30, face="bold"), legend.text=element_text(size=30, face="bold")) + xlab("containers") + ylab('energy (Kwh)') + scale_x_continuous(breaks=c(0,numOfContainer/4, numOfContainer/2, (numOfContainer*3/4),numOfContainer))
	#+ geom_point(aes(color=label)) 
	p

	ggsave(paste(base, "/energyIncreasing_run", run, ".png", sep=''), height=10, width=15)
	ggsave(paste(base, "/energyIncreasing_run", run, ".eps", sep=''), height=10, width=15)

}
