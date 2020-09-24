
cat("Usage: min_max(numOfVm = 'ten', numOfApp = 50)\n")
min_max <- function(numOfVm = 'ten', numOfApp = 50){
	filePath <- paste("../paretoFront/combinedAll/", numOfVm, "_app", numOfApp, ".csv", sep='')
	resultPath <- paste("../min_max/", numOfVm, "_app", numOfApp, ".csv", sep ='')
	data <- read.csv(filePath, header=F, sep=',')
	maxEnergy <- max(data[, 1])
	minEnergy <- min(data[, 1])

	maxAvail <- max(data[, 2])
	minAvail <- min(data[, 2])

	cat("maxEnergy = ", maxEnergy, "minEnergy = ", minEnergy, "\n")
	cat("maxAvail = ", maxAvail, "minAvail = ", minAvail, "\n")

	finalData <- c(minEnergy, maxEnergy)
	finalData <- rbind(finalData, c(minAvail, maxAvail))
	write.table(finalData, resultPath, row.names=F, col.names=F, sep=',')
}

