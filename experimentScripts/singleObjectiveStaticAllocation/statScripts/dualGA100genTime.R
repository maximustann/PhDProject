cat("Usage: meanTime('dualPermutationNF', 'twenty', 1000)\n")

meanTime <- function(alg, vmSize, containerSize){
	fileBase <- paste("../", alg, "/", vmSize, '/Container', containerSize, '/', sep='')
	value <- vector()
	for(i in seq(1, 40)){
		filePath <- paste(fileBase, i, '/convergence.csv', sep='')
		value <- rbind(value, c(unlist(read.csv(filePath, sep=',', header=F)[100, 1]), 0))
	}
	#writeLines(value, paste(fileBase, 'time.csv', sep=''))
	write.table(value, paste(fileBase, 'time.csv', sep=''), sep=',', row.names=F, col.names=F, quote=F)
}
