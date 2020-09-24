cat("Usage: meanStd('groupGA', 'twenty', '1000')\n")
meanStd <- function(alg, vmSize, containerSize){
	filePath <- paste('../', alg, '/', vmSize, '/Container', containerSize, '/energy.csv', sep='')

	data <- unlist(read.csv(filePath, header=F))
	
	meanValue <- mean(data)
	sdValue <- sd(data)
	writeLines(paste(meanValue, ',', sdValue, sep=''), paste('../', alg, '/', vmSize, '/Container', containerSize, '/meanStd.csv', sep=''))
}
