cat("Usage: meanStd(alg='dual', vmSize='ten', appSize=150, run=1)\n")

meanStd <- function(alg='dual', vmSize='ten', appSize=150, run=1){

	base <- "/local/scratch/tanboxi/multiObjContainerAllocation/"
	#multiGroupGaParetoPath <- paste(base, 'multiGroupGA/', vmSize, '/app', appSize, '/', run, '/paretoFront.csv', sep='')
	#multiGroupGA <- read.csv(multiGroupGaParetoPath, header=F, sep=',')[, 1:2]
	algPath <- paste(base, alg, '/', vmSize, '/app', appSize, '/', run, '/paretoFront.csv', sep='')
	alg <- read.csv(algPath, header=F, sep=',')[, 1:2]



	energy <- alg[, 1]
	availability <- alg[, 2]

	writeLines(paste(mean(energy), ',', sd(energy), sep=''), paste(base, alg, '/', vmSize, '/app', appSize, '/', run, '/energyMeanSd.csv', sep=''))
	writeLines(paste(mean(availability), ',', sd(availability), sep=''), paste(base, alg,'/', vmSize, '/app', appSize, '/', run, '/availabilityMeanSd.csv', sep=''))
}
