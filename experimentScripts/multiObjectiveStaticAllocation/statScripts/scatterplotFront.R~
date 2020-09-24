library(ggplot2)
library(nsga2R)

cat("Usage: scatterplotFront(vmSize='ten', appSize=150) \n")

scatterplotFront <- function(vmSize='ten', appSize=150){

		findTrueFront <- function(data){
		#data <- vector()
		bestFront <- vector()
		#for(algorithm in algorithms){
			#filename <- paste('../', algorithm, '/result/', problem, '/best/', problem, '.csv', sep = '')
			#data <- rbind(data, read.table(filename, header = T, sep = ',')[, 1:2])
		#}
		ranking <- fastNonDominatedSorting(data)
		rnkIndex <- integer()
		i <- 1
		while(i <= length(ranking)){
			rnkIndex[ranking[[i]]] <- i
			i <- i + 1
		}
		data <- cbind(data, rnkIndex)
		bestFront <- data[data[, 3] == 1, 1:2]
		bestFront
	}



	base <- "/local/scratch/tanboxi/multiObjContainerAllocation/"
	spreadPath <- paste(base, 'Spread/', vmSize, "/app", appSize, "/paretoFront.csv", sep = '')
	ffBfFfPath <- paste(base, "ffBfFF/", vmSize, "/app", appSize, "/paretoFront.csv", sep ='')
	multiGroupGA <- data.frame()
	#dual <- data.frame()

	for(i in seq(30)){
		multiGroupGaPath <- paste(base, "multiGroupGA/", vmSize, '/app', appSize, "/", i, "/paretoFront.csv", sep='')
		multiGroupGA <- rbind(multiGroupGA, read.csv(multiGroupGaPath, header=F, sep=',')[, 1:2])
	}
	bestMultiGroupGA <- findTrueFront(multiGroupGA)
	ffBfFF <- read.csv(ffBfFfPath, header=F, sep=',')[, 1:2]
	spread <- read.csv(spreadPath, header=F, sep=',')[, 1:2]
	#for(i in seq(30)){
		#dualPath <- paste(base, 'dual/', vmSize, "/app", appSize, "/", i, "/paretoFront.csv", sep = '')
		#dual <- rbind(dual, read.csv(dualPath, header=F, sep=',')[, 1:2])
	#}
	#print(multiGroupGA)
	bestMultiGroupGA <- cbind(bestMultiGroupGA, "NS-GGA")
	ffBfFF <- cbind(ffBfFF, "FF&BF/FF")
	spread <- cbind(spread, "Spread")
	#dual <- cbind(dual, "Dual-chromosome GA")

	colnames(bestMultiGroupGA) <- c("energy", "failure", "algorithm")
	colnames(ffBfFF) <- c('energy', 'failure', 'algorithm')
	colnames(spread) <- c('energy', 'failure', 'algorithm')
	#colnames(dual) <- c('energy', 'failure', 'algorithm')

	data <- rbind(ffBfFF, spread, bestMultiGroupGA)
	#data <- rbind(dual, bestMultiGroupGA)
	p <- ggplot(data, aes(x=energy, y=failure, fill=algorithm)) +
		geom_point(size=6, shape=21, stroke=1) +
		scale_fill_brewer(palette="Set1") +
		xlab("Energy (Kwh)") +
		ylab("Failure") +
		theme(legend.position="bottom", 
		legend.text = element_text(size=35, face="bold"),
		legend.title = element_blank(),
		axis.text = element_text(size=30, face="bold"), 
		axis.title = element_text(size=30, face="bold"))
		p

		ggsave(paste("../paretoFront/", vmSize, "_app", appSize, ".png", sep=''), height=10, width=15)
		ggsave(paste("../paretoFront/", vmSize, "_app", appSize, ".eps", sep=''), height=10, width=15)

	

}
