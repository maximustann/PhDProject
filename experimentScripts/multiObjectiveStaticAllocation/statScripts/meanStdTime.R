cat("Usage: meanStdTime('groupGA', 'twenty', '1000')\n")
meanStdTime <- function(alg, vmSize, containerSize){
	filePath <- paste('../', alg, '/', vmSize, '/Container', containerSize, '/time.csv', sep='')

	data <- unlist(read.csv(filePath, header=F)[, 1])
	
	meanValue <- mean(data)
	sdValue <- sd(data)
	writeLines(paste(meanValue, ',', sdValue, sep=''), paste('../', alg, '/', vmSize, '/Container', containerSize, '/meanStdTime.csv', sep=''))
}
