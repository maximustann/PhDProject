

vmDist <- function(base){
	allData <- vector()
	for(i in seq(0, 199)){
		filePath <- paste(base, '/testCase', i, '/pm.csv', sep='')
		data <- unlist(read.csv(filePath, header=F))
		data <- data[!is.na(data)]
		allData <- c(allData, data)
	}

	hist(allData, breaks=250)
}
