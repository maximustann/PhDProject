cat('Usage: medianHv(algorithm="multiGroupGA", numOfVm="ten", numOfApp=50)\n')
medianHv <- function(algorithm="multiGroupGA", numOfVm="ten", numOfApp=50){
	filePath <- paste('../', algorithm, '/', numOfVm, '/app', numOfApp, '/hypervolume.csv', sep='')
	data <- unlist(read.csv(filePath, header=F, sep=','))

	data2 <- sort(data)
	if(length(data2) %% 2 == 0){
		medianHyper <- data2[length(data2) / 2]
	} else {
		medianHyper <- data2[length(data2) / 2 + 1]
	}
	index <- 0
	for(i in seq(1, length(data))){
		if(medianHyper == data[i]){
			index <- i
			break
		}
	}
	print(index)
}
