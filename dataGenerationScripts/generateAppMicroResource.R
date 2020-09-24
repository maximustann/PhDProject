source('generateTaskCases.R')
cat("Usage: generateAppMicroResource(numOfApp = 100, numOfVm = 10|20, seed=1)\n")
generateAppMicroResource <- function(numOfApp, numOfVm, seed){
	set.seed(seed)


	translation <- function(microServiceVector, microServiceResource, filename){
		print(microServiceVector)
		completeResource <- data.frame()
		microService <- vector()
		appVector <- vector()
		totalMicroService <- sum(microServiceVector)
		for(i in seq(length(microServiceVector))){
			appVector <- c(appVector, rep(i, microServiceVector[i]))
			microService <- c(microService, seq(microServiceVector[i]))
		}
		completeResource <- data.frame(microServiceResource, appVector, microService)
		write.table(completeResource, filename, row.names=F, col.names=F, quote=F, sep=',')
	}
	
	generateSingleService <- function(maximumServiceNum){
		services <- sample(maximumServiceNum, 1, replace=T)
		services
	}

	maximumServiceNum <- 5
	maximumReplicasNum <- 5
	totalServiceNum <- 0
	data <- vector()
	for(i in seq(numOfApp)){
		service <- generateSingleService(maximumServiceNum)
		data <- c(data, service)
	}
	totalServiceNum <- sum(data)


	write.table(data, paste("micro-service/application", numOfApp, "_", seed, ".csv", sep=''), row.names = F, col.names = F, sep=',')


	if(numOfVm == 10){
		testCaseName <- paste('micro-service/testCase', numOfApp, '_ten_', seed, '.csv', sep='')
		#testCaseSizePath <- paste('micro-service/testCaseSize', numOfApp, '_ten_', seed, '.csv', sep='')
		generateTask(1, 6, totalServiceNum, 0, paste('micro-service/testCase', numOfApp, '_ten_', seed, '.csv', sep=''))
		resource <- read.csv(testCaseName, header=F, sep=',')
		translation(data, resource, testCaseName)
	}
	else{
		testCaseName <- paste('micro-service/testCase', numOfApp, '_twenty_', seed, '.csv', sep='')
		#testCaseSizePath <- paste('micro-service/testCaseSize', numOfApp, '_twenty_', seed, '.csv', sep='')
		generateTask(1, 7, totalServiceNum, 0, paste('micro-service/testCase', numOfApp, '_twenty_', seed,  '.csv', sep=''))
		resource <- read.csv(testCaseName, header=F, sep=',')
		translation(data, resource, testCaseName)
	}
}


generateRandomReplicas <- function(testCasePath){
	maximumReplicasNum <- 5
	testCase <- read.csv(testCasePath, header=F, sep=',')
	numOfService <- nrow(testCase)
	temp <- data.frame()
	for(i in seq(numOfService)){
		replicas <- sample(maximumReplicasNum, 1, T)
		
		replicaRow <- vector()
		for(j in seq(replicas)){
			replicaRow <- rbind(replicaRow, testCase[i, ])
		}
		replicaRow <- cbind(replicaRow, seq(replicas))
		temp <- rbind(temp, replicaRow)
		#temp <- rbind(temp, cbind(rep(testCase[i,], replicas), seq(replicas)))
		
	}

	write.table(temp, testCasePath, row.names=F, col.names=F, quote=F, sep=',')
}



