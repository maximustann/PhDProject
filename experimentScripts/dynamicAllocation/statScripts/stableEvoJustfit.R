library(ggplot2)
cat('Usage: stableness(base, run, numOfContainer)\n')

stableness <- function(base, run, numOfContainer){
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

	#evoOneLevel <- list()
	#for(i in seq(0, 29)){
	
		#evoPath <- paste(base, 'evoContainerLevel/evo', i, '/', run, '/energy.csv', sep='')
		#evoData <- unlist(read.csv(evoPath, header=F))
		#evoOneLevel[[i+1]] <- evoData
	#}

	#evoOneSum <- evoOneLevel[[1]]
	#for(i in seq(2, 30)){
		#evoOneSum <- evoOneSum + evoOneLevel[[i]]
	#}
	#evoOneAverage <- evoOneSum / 30
	#evoOneAverage <- evoOneAverage 

	justFitSub <- unlist(read.csv(justfitPath, header=F)) / seq(1, numOfContainer+1)
	#print(justFitSub)
	#evoOneAverage <- unlist(evoOneAverage) / seq(1, numOfContainer + 1)
	evoTwoAverage <- unlist(evoTwoAverage) / seq(1, numOfContainer + 1)

	mark <- rep(seq(1, numOfContainer+1), 2)
	labels <- c(rep('aaaaaaaaaaaa', numOfContainer+1), rep('bbbbbb', numOfContainer+1))
	data <- data.frame(label=labels, mark=mark, SlopeOfIncrement=c(justFitSub, evoTwoAverage))

	p <- ggplot(data=data, aes(x=mark, y=SlopeOfIncrement, fill=label)) + geom_line(aes(col=label), size=1) + scale_color_manual(values=c('#fa9d22', 'cyan')) + 
		labs(x="Container", y="Slope") + 
		ylim(7.5, 15) + xlim(500, 2500) + 
		theme(panel.background = element_rect(fill='#444B5A'), panel.grid.minor=element_line(color='#4d5566'), panel.grid.major=element_line(color='#586174'),  plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(hjust=0.5, face="bold"), axis.text.x=element_text(size=30), axis.text.y=element_text(size=30, angle=90), legend.position=c(0.75, 0.85), legend.title=element_blank(), legend.text=element_text(size=40))
	p
	#p <- ggplot(data=data, aes(x=mark, y=SlopeOfIncrement, group=label)) + geom_line(aes(color=label), size=1) + scale_color_brewer(palette="Set1", labels=c("sub&Just-Fit/FF", "evo/evo")) + theme(legend.position=c(0.2,0.85), axis.text=element_text(size=30, face="bold"), axis.title=element_text(size=30, face="bold"), legend.text=element_text(size=30, face="bold")) + xlab("containers") + ylab('slope') + scale_x_continuous(breaks=c(0,numOfContainer/4, numOfContainer/2, (numOfContainer*3/4),numOfContainer))+ylim(5, 15)
	#+ geom_point(aes(color=label)) 
	#p

	ggsave(paste(base, "/slope_", run, ".png", sep=''), height=10, width=10)
	ggsave(paste(base, "/slope_", run, ".eps", sep=''), height=10, width=10)


}
