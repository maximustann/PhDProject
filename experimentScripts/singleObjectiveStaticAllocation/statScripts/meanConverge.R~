cat("Usage: meanConverge('groupGA', 'twenty', 1000)\n")
meanConverge <- function(alg, vmSize, containerSize){
	base <- paste('/vol/grid-solar/sgeusers/tanboxi/', alg, '/', vmSize, '/Container', containerSize, '/', sep='')
	out <- paste('/local/scratch/tanboxi/staticContainerAllocation/', alg, '/', vmSize, '/Container', containerSize, '/convergence.csv', sep='')
	files <- list.files(base)
	totalTime <- numeric(100)
	totalFitness <- numeric(100)
	counter <- 1

	for(file in files){
		filePath <- paste(base, file, '/convergenceCurve.csv', sep='')
		time <- unlist(read.csv(filePath, header=F, sep=',')[, 1])
		fitness <- unlist(read.csv(filePath, header=F, sep=',')[, 2])
		totalTime <- totalTime + time
		totalFitness <- totalFitness + fitness
	}

	totalTime <- totalTime / 40
	totalFitness <- totalFitness / 40
	data <- data.frame(totalTime, totalFitness)
	write.table(data, out, sep=',', quote=F, row.names=F, col.names=F)
}
