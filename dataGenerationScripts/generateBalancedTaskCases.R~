
cat("for(i in seq(0,199)) generateTask(2, 8, 200, i, paste('./balanced_container200_small/testCase', i, '.csv', sep=''))\n")

generateTask <- function(whichDataSet, whichVMsize, size, testCase, filename=''){
	set.seed(testCase + size)
	dataSetSource <- c('realWorldData.csv', 'tpMatrix.txt')
	dataset <- dataSetSource[whichDataSet]
	vmConfigFile <- c('VMConfig_small_balanced.csv', 'VMConfig_small.csv', 'VMConfig_medium.csv', 'VMConfig_large.csv', 'VMConfig_xLarge.csv','VMConfig_xSmall.csv', 'VMConfig_xSmall_balanced.csv', 'VMConfig_ten.csv', 'VMConfig_twenty_real.csv')


	vmConfig <- paste('./VM_DataSet/', vmConfigFile[whichVMsize], sep='')
	vmCpu <- unlist(read.csv(vmConfig, header = F, sep = ",")[, 1])
	vmMem <- unlist(read.csv(vmConfig, header = F, sep = ",")[, 2])

	vmCpuLimit <- max(vmCpu)
	vmMemLimit <- max(vmMem)
	#cat("vmCpuLimit = ", vmCpuLimit, "\n")
	#cat("vmMemLimit = ", vmMemLimit, "\n")

	vmCPUOverHeadRate <- 0.1
	vmMemOverhead <- 200

	vmCpuLimit <- vmCpuLimit - vmCpuLimit * vmCPUOverHeadRate
	vmMemLimit <- vmMemLimit - vmMemOverhead


	writeTask <- function(whichDataSet=2, data, vmType, testCase, filename){
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

	generateRealWorldData <- function(datasetName, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase){

	selectFromData <- function(datasetName, size){
		data <- read.csv(datasetName, header=F, sep=',')
		choose <- sample(1:nrow(data), size, replace=F)
		myData <- data[choose, ]
		myData
	}


		fix <- function(size, data, vmCpuLimit, vmMemLimit, datasetName){
			dataset <- read.csv(datasetName, header=F, sep=',')
			for(i in 1:size){
				if(data[i, 1] > vmCpuLimit || data[i, 2] > vmMemLimit){
					repeat{
						data[i, ] <- dataset[sample(1:nrow(dataset), 1, replace=F), ]
						if(data[i, 1] <= vmCpuLimit && data[i, 2] <= vmMemLimit) break
					} # End repeat
				} # End If
			} # End for
			
			data
		
		} # End fix


		# function begins
		myData <- selectFromData(datasetName, size)
		myData <- fix(size, myData, vmCpuLimit, vmMemLimit, datasetName)
		writeTask(whichDataSet = 2, myData, whichVMsize, testCase, filename)
		print('generate real world data')
	}

	generateArtificialData <- function(datasetName, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase, vmCpu, vmMem){

		taskM <- ceiling(rexp(size, 0.01))
		#taskTh <- selectFromData(datasetName, size)
		#taskTh <- ceiling(runif(size, 1, 100))
		taskA <- ceiling(rexp(size, 0.001))
		# repair the generated dataset
		for(i in seq_along(taskA)){
			if(taskA[i] > vmCpuLimit){
				repeat {
					taskA[i] <- ceiling(rexp(1, 0.001))
					if(taskA[i] <= vmCpuLimit){
						break;
					}
				}
			}
		}
	
		for(i in seq_along(taskM)){
			if(taskM[i] > vmMemLimit){
				repeat {
					taskM[i] <- ceiling(rexp(1, 0.01))
					if(taskM[i] <= vmMemLimit){
						break;
					}
				}
			}
		}


		for(i in seq_along(taskA)){
			for(j in seq(vmCpu)){
				if(taskA[i] > vmCpu[j] || taskM[i] > vmMem[j]){
					repeat {
						taskA[i] <- ceiling(rexp(1, 0.001))
						taskM[i] <- ceiling(rexp(1, 0.01))
						
						if(taskA[i] <= vmCpu[j] && taskM[i] <= vmMem[j]){
							break;
						}
					}
				}
			}
		}
	
		#testCaseData <- cbind(taskA, taskM, osTypes)

		testCaseData <- cbind(taskA, taskM)
	
		writeTask(whichDataSet = 2, testCaseData, whichVMsize, testCase, filename)
		print('generate articial data')

	} # End of generateArtificialData


	if(whichDataSet == 1){ # 1 means real world dataset
		generateRealWorldData(dataset, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase)
	} else { 				# 2 means articial dataset
		generateArtificialData(dataset, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase, vmCpu, vmMem)
	}


}




