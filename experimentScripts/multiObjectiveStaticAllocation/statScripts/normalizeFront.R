
cat("Usage: normalizeFront(algorithm='multiGroupGA', numOfVm = 'ten', numOfApp = 50)\n")
normalizeFront <- function(algorithm='multiGroupGA', numOfVm = 'ten', numOfApp = 50){
	iter <- 40
	minMaxFile <- paste('../min_max/', numOfVm, "_app", numOfApp, ".csv", sep="")
	minMaxData <- read.csv(minMaxFile, header=F, sep=',')
	minEnergy <- minMaxData[1, 1]
	maxEnergy <- minMaxData[1, 2]
	minAvail <- minMaxData[2, 1]
	maxAvail <- minMaxData[2, 2]

	for(i in 1:40){
		filePath <- paste('../', algorithm, '/', numOfVm, "/app", numOfApp, "/", i, "/paretoFront.csv", sep='')
		resultPath <- paste('../', algorithm, '/', numOfVm, "/app", numOfApp, "/", i, "/normParetoFront.csv", sep='')
		data <- read.csv(filePath, header=F, sep=',')[, 1:2]
		normalizedEnergy <- (data[, 1] - minEnergy) / (maxEnergy - minEnergy)
		normalizedAvail <- (data[, 2] - minAvail) / (maxAvail - minAvail)
		normalizedData <- cbind(normalizedEnergy, normalizedAvail)
		write.table(normalizedData, resultPath, row.names=F, col.names=F, sep=',')
	}
}
