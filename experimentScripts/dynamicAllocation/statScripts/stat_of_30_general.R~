
# This script generates the statistic difference between three methods
cat("Usage: stat(base)\n")
stat <- function(base){

	justFitSubPath <- paste(base, 'justFitSub/Energy.csv', sep='')
	evoContainerPath <- paste(base, '/Energy.csv', sep='')
	evoTwoPath <- paste(base, 'possLar/Energy.csv', sep='')

	justFitSub <- unlist(read.csv(justFitSubPath, header=F))
	normalizedJustFit <- justFitSub / justFitSub

	evoContainer <- list()
	for(i in seq(0, 29)){
		evoContainerPath <- paste(base, 'evoContainerLevel/evo', i, '/Energy.csv', sep='')
		evo <- unlist(read.csv(evoContainerPath, header=F))
		evoContainer[[i + 1]] <- evo
	}


	evoTwoLevels <- list()
	for(i in seq(0, 29)){
		evoTwoPath <- paste(base, 'evoTwoLevels/evo', i, '/Energy.csv', sep='')
		evo <- unlist(read.csv(evoTwoPath, header=F))
		evoTwoLevels[[i + 1]] <- evo
	}


	#normalizedLargest <- largest / largest
	#normalizedJustfit <- justfit / largest
	#normalizedPossLar <- possLar / largest
	#normEvo <- list()
	evoContainerNorm <- list()
	evoTwoLevelsNorm <- list()

	totalEvoContainer <- vector()
	totalEvoTwoLevels <- vector()
	for(i in seq(1, 30)){
		evoContainerNorm[[i]] <- evoContainer[[i]] / justFitSub
		evoTwoLevelsNorm[[i]] <- evoTwoLevels[[i]] / justFitSub

		if(i == 1){
			totalEvoContainer <- evoContainerNorm[[i]]
			totalEvoTwoLevels <- evoTwoLevelsNorm[[i]]
			next
		}

		totalEvoContainer <- totalEvoContainer + evoContainerNorm[[i]]
		totalEvoTwoLevels <- totalEvoTwoLevels + evoTwoLevelsNorm[[i]]
	}
	#normalizedEvo <- subEvo / 30
	normalizedEvoContainer <- totalEvoContainer / 30
	normalizedEvoTwoLevels <- totalEvoTwoLevels / 30

	win <- 0
	draw <- 0
	for(i in seq(1, 30)){
		if(normalizedEvoTwoLevels[i] - normalizedEvoContainer[i] < 0){
			win <- win + 1
		} else if(normalizedEvoTwoLevels[i] == normalizedEvoContainer[i])
		{
			draw <- draw + 1
		}
	}
	#print(normalizedEvoTwoLevels - normalizedEvoContainer)
	cat("two levels wins : ", win, ', draw : ', draw, '\n')

	output <- ''
	output <- c(output, capture.output(cat('normalizedEvoContainer - normalizedJustFit = \n')))
	output <- c(output, capture.output(print(normalizedEvoContainer - normalizedJustFit)))

	output <- c(output, capture.output(print(wilcox.test(normalizedJustFit, normalizedEvoContainer, paired=T))))
	output <- c(output, capture.output(print(t.test(normalizedJustFit, normalizedEvoContainer, paired=T))))

	output <- c(output, capture.output(cat('\n normalizedEvoTwoLevels - normalizedEvoContainer= \n')))
	output <- c(output, capture.output(print(normalizedEvoTwoLevels - normalizedEvoContainer)))
	output <- c(output, capture.output(print(wilcox.test(normalizedEvoTwoLevels, normalizedEvoContainer, paired=T))))
	output <- c(output, capture.output(print(t.test(normalizedEvoTwoLevels, normalizedEvoContainer, paired=T))))
	
	#output <- c(output, capture.output(cat('\nnormalizedEvo - normalizedPossLar= \n')))
	#output <- c(output, capture.output(print(normalizedEvo - normalizedPossLar)))
	#output <- c(output, capture.output(print(wilcox.test(normalizedPossLar, normalizedEvo, paired=T))))
	#output <- c(output, capture.output(print(t.test(normalizedPossLar, normalizedEvo, paired=T))))

	writeLines(output, paste(base, "/StatOf30RunsGeneral.txt", sep=''))
}
