cat("for(i in seq(0, 99)) generateOScases(1000, 1, i, paste('./OS1Container1000/testCase', i, '.csv', sep=''))\n")
generateOScases <- function(size, numOfOS, testCase, filename=''){
	set.seed(testCase + size)


	generateSingle <- function(size){
		data <- rep(1, size)
		data
	}

	generateTwo <- function(size){
		# two types of OS
		# os1 probability = 0.95
		# os2 probability = 0.05
		os1 <- 0.95
		osTypes <- rep(0, size)
	
		for(i in seq(size)){
			u <- runif(1)
			if(u < os1) osTypes[i] <- 1
			else osTypes[i] <- 2
		}
		osTypes
	}


	generateThree <- function(size){
		# three types of OS
		# os1 probability = 0.5
		# os2 probability = 0.3
		# os3 probability = 0.2
		os1 <- 0.5
		os2 <- 0.8
		osTypes <- rep(0, size)
	
		for(i in seq(size)){
			u <- runif(1)
			if(u < os1) osTypes[i] <- 1
			else if((u >= os1) && (u < os2)) osTypes[i] <- 2
			else osTypes[i] <- 3
		}
		osTypes
	}

	generateFour <- function(size){
		# four types of OS 
		# os1 probability = 0.625
		# os2 probability = 0.175
		# os3 probability = 0.15
		# os4 probability = 0.05
		os1 <- 0.625
		os2 <- 0.8
		os3 <- 0.95
		osTypes <- rep(0, size)

	for(i in seq(size)){
		u <- runif(1)
		if(u < os1) osTypes[i] <- 1
		else if(u >= os1 && u < os2) osTypes[i] <- 2
		else if(u >= os2 && u < os3) osTypes[i] <- 3
		else osTypes[i] <- 4
		}
		osTypes
	}


	generateFive <- function(size){
		# five types of OS 
		# os1 probability = 0.179
		# os2 probability = 0.454
		# os3 probability = 0.236
		# os4 probability = 0.105
		# os5 probability = 0.026
		os1 <- 0.179
		os2 <- 0.633
		os3 <- 0.869
		os4 <- 0.974
		osTypes <- rep(0, size)

	for(i in seq(size)){
		u <- runif(1)
		if(u < os1) osTypes[i] <- 1
		else if(u >= os1 && u < os2) osTypes[i] <- 2
		else if(u >= os2 && u < os3) osTypes[i] <- 3
		else if(u >= os3 && u < os4) osTypes[i] <- 4
		else osTypes[i] <- 5
		}
		osTypes
	}

	if(numOfOS == 1){
		data <- generateSingle(size)
	} else if(numOfOS == 2){
		data <- generateTwo(size)
	}else if(numOfOS == 3){
		data <- generateThree(size)
	} else if(numOfOS == 4){
		data <- generateFour(size)
	} else if(numOfOS == 5){
		data <- generateFive(size)
	}

	writeFile <- function(numOfOS, data, testCase, filename){

		if(filename == ''){
			if(numOfOS == 1){
				filename <- paste("./OS_DataSet/single/os", testCase, ".csv", sep='')
			} else if(numOfOS == 3){
				filename <- paste("./OS_DataSet/three/os", testCase, ".csv", sep='')
			} else if(numOfOS == 2){
				filename <- paste("./OS_DataSet/two/os", testCase, ".csv", sep='')
			} else if(numOfOS == 4){
				filename <- paste("./OS_DataSet/four/os", testCase, ".csv", sep='')
			} else {
				filename <- paste("./OS_DataSet/five/os", testCase, ".csv", sep='')
			}
			write.table(data, filename, row.names=F, col.names=F, sep=',')
		} else {
			write.table(data, filename, row.names=F, col.names=F, sep=',')
		}
	}

	writeFile(numOfOS, data, testCase, filename)
	print('os generated')
}


