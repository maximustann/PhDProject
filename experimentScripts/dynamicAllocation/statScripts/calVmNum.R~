
calVmNum <- function(base){
	run <- 30
	evoTwoLevelsFile <- paste(base, 'evoTwoLevels/', sep='')
	evoContainerLevelFile <- paste(base, 'evoContainerLevel/', sep='')
	justFitSubFile <- paste(base, 'justFitSub/', sep='')

	evoTwoLevels <- vmDistNum(evoTwoLevelsFile, run)
	evoContainerLevel <- vmDistNum(evoContainerLevelFile, run)
	run <- 1
	justFitSub <- vmDistNum(justFitSubFile, run)
	
	three <- c(justFitSub, evoContainerLevel, evoTwoLevels)
	resultFile <- paste(base, '/vmNum.csv', sep='')
	write.table(three, resultFile, row.names=F, col.names=F, quote=F, sep=',')
}

vmDistNum <- function(base, run){
	vmNum <- 0
	for(i in seq(0, 29)){
		vmNum <- vmNum + vmNumRun(base, i, run)
	}
	vmNum <- vmNum / 30
	vmNum
}

vmNumRun <- function(base, simulation, run){
	vmNum <- 0
	for(i in seq(0, run - 1)){
		if(run > 1){
			dirBase <- paste(base, 'evo', i, '/', simulation, sep='')
		} else {
			dirBase <- paste(base, simulation, sep='')
		}
		fileName <- paste(dirBase,  '/pmStatus.csv', sep='')
		data <- read.csv(fileName, header=F, sep=',')
		vmNum <- vmNum + sum(data[, 8])
	}

	vmNum <- vmNum / run
	vmNum
}



