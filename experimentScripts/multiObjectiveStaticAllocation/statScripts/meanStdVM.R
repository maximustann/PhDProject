cat("Usage: meanStdVM('groupGA', 'twenty', '1000')\n")
meanStdVM <- function(alg, vmSize, containerSize){
	filePath <- paste('../', alg, '/', vmSize, '/Container', containerSize, '/numOfVm.csv', sep='')

	data <- unlist(read.csv(filePath, header=F)[, 1])
	
	meanValue <- mean(data)
	sdValue <- sd(data)
	writeLines(paste(meanValue, ',', sdValue, sep=''), paste('../', alg, '/', vmSize, '/Container', containerSize, '/meanStdVM.csv', sep=''))
}
