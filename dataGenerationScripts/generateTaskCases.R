cat("for(i in seq(0,199)) generateTask(1, 6, 2500, i, paste('./container2500/testCase', i, '.csv', sep=''))\n")
generateTask <- function(whichDataSet, whichVMsize, size, testCase, filename=''){
	set.seed(testCase + size)
	dataSetSource <- c('auvergrid.csv', 'bitbrains.csv')
	dataset <- dataSetSource[whichDataSet]
	vmConfigFile <- c('VMConfig_small.csv', 'VMConfig_medium.csv', 'VMConfig_large.csv', 'VMConfig_xLarge.csv', 'VMConfig_xSmall.csv', 'VMConfig_ten.csv', 'VMConfig_twenty_real.csv')
	vmCPUOverHeadRate <- 0.1
	vmMemOverhead <- 200


	vmConfig <- paste('./VM_DataSet/', vmConfigFile[whichVMsize], sep='')
	vmCpu <- unlist(read.csv(vmConfig, header = F, sep = ",")[, 1])
	vmMem <- unlist(read.csv(vmConfig, header = F, sep = ",")[, 2])

	vmCpuLimit <- vmCpu - vmCpu * vmCPUOverHeadRate
	vmMemLimit <- vmMem - vmMemOverhead

	noOfVm <- length(vmCpu)


	#vmCpuLimit <- vmCpuLimit - vmCpuLimit * vmCPUOverHeadRate
	#vmMemLimit <- vmMemLimit - vmMemOverhead


	writeTask <- function(whichDataSet, data, vmType, testCase, filename){
		if(filename != ''){
			write.table(data, filename, row.names = F, col.names = F, sep=',')
			return
		} else {
			if(whichDataSet == 1){
				filename <- paste("./Container_DataSet/real/", vmType, "/testCase", testCase, ".csv", sep='')
			} else {
				filename <- paste("./Container_DataSet/artificial/", vmType, "/testCase", testCase, ".csv", sep='')
			}
			write.table(data, filename, row.names = F, col.names = F, sep=',')
		}
	}

	generateRealWorldData <- function(datasetName, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase, vmCpu, vmMem, numOfVm){

		flag <- 0
		selectFromData <- function(datasetName, size){
			data <- read.csv(datasetName, header=F, sep=',')
			choose <- sample(1:nrow(data), size, replace=F)
			myData <- data[choose, ]
			myData
		}

		fix <- function(size, data, vmCpuLimit, vmMemLimit, numOfVm, datasetName){

			dataset <- read.csv(datasetName, header=F, sep=',')
			for(i in 1:size){
				flag <- F
				for(j in 1:numOfVm){
					if(data[i, 1] <= vmCpuLimit[j] && data[i, 2] <= vmMemLimit[j]){
						flag <- T
						break
						#repeat{
							#data[i, ] <- dataset[sample(1:nrow(dataset), 1, replace=F), ]
							#if(data[i, 1] <= vmCpuLimit && data[i, 2] <= vmMemLimit) break
						#} # End repeat
					} # End If
					#else {
						#for(i in 1:length(vmCpu)){
							#if(data[i, 1] > vmCpu[i] && data[i, 2] > vmMem[i]){
								#flag <- 1
							#} # End If
						#}
						#if(flag == 1){
							#repeat{
								#data[i, ] <- dataset[sample(1:nrow(dataset), 1, replace=F), ]
								#if(data[i, 1] <= vmCpuLimit && data[i, 2] <= vmMemLimit) break
							#} # End repeat
							#flag <- 0
						#}
					#}
				}#end inner for
				if(flag == F){
					#cat(data[i, 1], ":", data[i, 2], '\n')
					repeat{
						data[i, ] <- dataset[sample(1:nrow(dataset), 1, replace=F), ]
						for(j in 1:numOfVm){
							if(data[i, 1] <= vmCpuLimit[j] && data[i, 2] <= vmMemLimit[j]){
								flag <- T
								break
							}
						}
						if(flag == T){
							break
						}
					}
				}
			} # End for
			data
		} # End fix


		# function begins
		myData <- selectFromData(datasetName, size)
		myData <- fix(size, myData, vmCpuLimit, vmMemLimit, noOfVm, datasetName)
		writeTask(whichDataSet, myData, whichVMsize, testCase, filename)
		#print('generate real world data')
	}

	generateArtificialData <- function(datasetName, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase){

		#selectFromData <- function(datasetName, size){
			#data <- unlist(read.table(datasetName, header = F))
			#data <- data[!data < 0]
			#myData <- sample(unlist(data), size, replace = T)
			#myData
		#}



		taskM <- ceiling(rexp(size, 0.01))
		#taskTh <- unlist(selectFromData(datasetName, size))
		taskA <- ceiling(rexp(size, 0.001))
		# repair the generated dataset
		for(i in seq_along(taskA)){
			if(taskA[i] > vmCpuLimit){
				repeat {
					taskA[i] <- ceiling(rexp(1, 0.001))
					if(taskA[i] <= vmCpuLimit)
						break;
				}
			}
		}
	
		for(i in seq_along(taskM)){
			if(taskM[i] > vmMemLimit){
				repeat {
					taskM[i] <- ceiling(rexp(1, 0.01))
					if(taskM[i] <= vmMemLimit)
						break;
				}
			}
		}
	
		#testCaseData <- cbind(taskA, taskM, osTypes)
		testCaseData <- cbind(taskA, taskM)
	
		writeTask(whichDataSet, testCaseData, whichVMsize, testCase, filename)
		print('generate articial data')

	} # End of generateArtificialData


	#if(whichDataSet == 1){ # 1 means real world dataset
		generateRealWorldData(dataset, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase, vmCpu, vmMem, noOfVm)
	#} else { 				# 2 means articial dataset
		#generateArtificialData(dataset, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase)
		#generateRealWorldData(dataset, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase, vmCpu, vmMem, noOfVm)
	#}


}




