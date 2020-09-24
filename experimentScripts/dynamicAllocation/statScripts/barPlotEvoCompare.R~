library(ggplot2)


cat('Usage: plotInstance(base)\n')
plotInstance <- function(base){


	justFitSubPath <- paste(base, '/justFitSub/Energy.csv', sep='')
	evo1Path <- paste(base, '/evoContainerLevel/', sep='')
	evo2Path <- paste(base, '/evoTwoLevels/', sep='')
	
	justFitSub <- unlist(read.csv(justFitSubPath, header = F))
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
	twoLevelRuleBaselineDiffRate <- (justFitSub - twoLevelRuleAverage) / justFitSub * 100
	oneLevelRuleBaselineDiffRate <- (justFitSub - oneLevelRuleAverage) / justFitSub * 100

	diff <- twoLevelRuleBaselineDiffRate - oneLevelRuleBaselineDiffRate
	win <- 0
	draw <- 0
	lose <- 0
	for(i in diff){
		if(i > 0) win <- win + 1
		else if(i == 0) draw <- draw + 1
		else lose <- lose + 1
	}
	cat("win: ", win, ", draw: ", draw, ", lose: ", lose, "\n")

	x_axis <- seq(1, 30)
	type <- c(rep("evo/evo", 30), rep("evo/FF", 30))
	#type <- c(rep("justfit", 30), rep("osProb", 30))
	#type <- rep("justfit", 30)

	data <- data.frame(x = x_axis, y = c(twoLevelRuleBaselineDiffRate, oneLevelRuleBaselineDiffRate), type)
	#data <- data.frame(x = x_axis, y = justfitLargestDiffRate, type)
	#evoColor <- ifelse(evoLargestDiff > 0, "red", "darkred")
	#justfitColor <- ifelse(justfitLargestDiff > 0, "green", "darkgreen")
	#osProbColor <- ifelse(osProbLargestDiff > 0, "blue", "darkblue")

	#print(data)

	p <- ggplot(data, aes(x=x, y=y))
	p + geom_bar(stat = "identity", aes(fill = type), position="dodge") + xlab("test instance") + ylab("Energy difference with sub&Just-Fit/FF (rate)") + scale_x_continuous(breaks=0:30) + theme_bw() + theme(axis.text = element_text(size = 15, face="bold"), legend.text = element_text(size=20, face="bold"), axis.title = element_text(size=18, face="bold")) 
	#+ scale_fill_manual(values=c("#000309", "#4BA8F0")) 
	ggsave("../evoCompare.png", height=10, width=20)
		
	#geom_segment(aes(x=evo_x_axis, xend=evo_x_axis, y=0, yend=evo, color=evoColor), size=1.3, alpha=0.9) + geom_segment(aes(x=justfit_x_axis, xend=evo_x_axis, y=0, yend=justfit, color=justfitColor), size=1.3, alpha=0.9) 

	#+ theme_light() 
	#+ theme(legend.position = "none", panel.border=element_blank()) + xlab("") + ylab("Value")

}

