
cat('Usage: calVmDist(base, 10 | 20)\n')
calVmDist <- function(base, vmNo){
	if(vmNo == 10){
		source('vmDist.R')
	} else {
		source('vmDist20.R')
	}
	run <- 30
	evoTwoLevelsFile <- paste(base, 'evoTwoLevels/', sep='')
	evoContainerLevelFile <- paste(base, 'evoContainerLevel/', sep='')
	justFitSubFile <- paste(base, 'justFitSub/', sep='')

	evoTwoLevels <- vmDist(evoTwoLevelsFile, run)
	evoContainerLevel <- vmDist(evoContainerLevelFile, run)
	run <- 1
	justFitSub <- vmDist(justFitSubFile, run)
	
	three <- cbind(evoTwoLevels, evoContainerLevel, justFitSub)
	colnames(three) <- c('evo/evo', 'evo/FF', 'Sub-JustFit/FF')
	resultFile <- paste(base, '/vmDist.csv', sep='')
	write.table(three, resultFile, row.names=F, quote=F, sep=',')
}
