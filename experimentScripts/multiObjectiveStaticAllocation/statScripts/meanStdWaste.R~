cat("Usage: meanStdWaste('groupGA', 'twenty', '1000')\n")
meanStdWaste <- function(alg, vmSize, containerSize){
	filePath <- paste('../', alg, '/', vmSize, '/Container', containerSize, '/wastedResource.csv', sep='')

	data <- unlist(read.csv(filePath, header=F))
	
	meanValue <- mean(data)
	sdValue <- sd(data)
	writeLines(paste(meanValue, ',', sdValue, sep=''), paste('../', alg, '/', vmSize, '/Container', containerSize, '/meanStdWaste.csv', sep=''))
}
