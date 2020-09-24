

cat('Usage: evoEnergyDifference(base) \n')
evoEnergyDifference <- function(base){
	
	evo1Path <- paste(base, '/evoContainerLevel/', sep='')
	evo2Path <- paste(base, '/evoTwoLevels/', sep='')
	justFitSubPath <- paste(base, '/justFitSub/Energy.csv', sep='')


	justFitSub <- unlist(read.csv(justFitSubPath, header=F))
	twoLevelRule <- list()
	for(i in seq(0, 29)){
		twoLevelRulePath <- paste(evo2Path, 'evo', i, '/Energy.csv', sep='')
		twoLevelRuleData <- unlist(read.csv(twoLevelRulePath, header = F))
		twoLevelRule[[i + 1]] <- twoLevelRuleData
	}

	twoLevelRuleTotal <- vector()
	for(i in seq(1, 30)){
		instance <- 0
		for(j in seq(1, 30)){
			instance <- instance + twoLevelRule[[j]][i]
		}
		twoLevelRuleTotal <- c(twoLevelRuleTotal, instance)
	}

	oneLevelRule <- list()
	for(i in seq(0, 29)){
		oneLevelRulePath <- paste(evo1Path, 'evo', i, '/Energy.csv', sep='')
		oneLevelRuleData <- unlist(read.csv(oneLevelRulePath, header = F))
		oneLevelRule[[i + 1]] <- oneLevelRuleData
	}

	oneLevelRuleTotal <- vector()
	for(i in seq(1, 30)){
		instance <- 0
		for(j in seq(1, 30)){
			instance <- instance + oneLevelRule[[j]][i]
		}
		oneLevelRuleTotal <- c(oneLevelRuleTotal, instance)
	}

	twoLevelRuleAverage <- twoLevelRuleTotal / 30
	oneLevelRuleAverage <- oneLevelRuleTotal / 30

	twoLevelMean <- mean(twoLevelRuleAverage)
	twoLevelSd <- sd(twoLevelRuleAverage)

	oneLevelMean <- mean(oneLevelRuleAverage)
	oneLevelSd <- sd(oneLevelRuleAverage)

	justFitSubMean <- mean(justFitSub)
	justFitSubSd <- sd(justFitSub)

	cat('evo/evo mean = ', twoLevelMean, ' ,sd = ', twoLevelSd, '\n')
	cat('evo/FF mean = ', oneLevelMean, ' ,sd = ', oneLevelSd, '\n')
	cat('justFitSub/FF mean = ', justFitSubMean, ' ,sd = ', justFitSubSd, '\n')
}
