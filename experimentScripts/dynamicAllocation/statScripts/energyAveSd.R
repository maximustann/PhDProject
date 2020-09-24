cat('Usage energyAveSd(algPath) \n')

energyAveSd <- function(algPath){

	ccgp <- vector()
	for(i in seq(0, 29)){

		dataPath <- paste(algPath, 'evo', i, '/Energy.csv', sep='')
		ccgpData <- mean(unlist(read.csv(dataPath, header=F)))
		ccgp <- c(ccgp, ccgpData)
	}


	cat('mean: ', formatC(mean(ccgp), format="e"), ', sd: ', formatC(sd(ccgp), format="e"), '\n')

}
