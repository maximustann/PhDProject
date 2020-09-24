cat('Usage: generateBaseDataCenter(testCaseSize, OSNum, testCase)\n')
generateBaseDataCenter <- function(testCaseSize, OSNum, testCase){
	set.seed(testCaseSize + testCase)


	generateArtificialData <- function(datasetName, whichVMsize, vmCpuLimit, vmMemLimit, size, testCase){

		selectFromData <- function(datasetName, size){
			data <- unlist(read.table(datasetName, header = F))
			data <- data[!data < 0]
			myData <- sample(unlist(data), size, replace = T)
			myData
		}



		taskM <- ceiling(rexp(size, 0.001))
		taskTh <- unlist(selectFromData(datasetName, size))
		taskA <- ceiling(rexp(size, 0.001))
		# repair the generated dataset
		for(i in seq_along(taskA)){
			if(taskTh[i] * taskA[i] > vmCpuLimit){
				repeat {
					taskA[i] <- ceiling(rexp(1, 0.001))
					if(taskTh[i] * taskA[i] <= vmCpuLimit)
						break;
				}
			}
		}
	
		for(i in seq_along(taskM)){
			if(taskTh[i] * taskM[i] > vmMemLimit){
				repeat {
					taskM[i] <- ceiling(rexp(1, 0.001))
					if(taskTh[i] * taskM[i] <= vmMemLimit)
						break;
				}
			}
		}
	
		#testCaseData <- cbind(taskA, taskM, osTypes)
		testCaseData <- cbind(taskA, taskM)
	
		writeTask(whichDataSet, testCaseData, whichVMsize, testCase, filename)
		print('generate articial data')

	} # End of generateArtificialData

	generateVMtype <- function(vmCPU, vmMEM, pmCPU, pmMem, OSNum){
		myPMCpu <- pmCPU
		myPMMem <- pmMem

		vm <- vector()

		# if there is only one vm, just assign the largest
		if(OSNum == 1){
			vm <- 5
			return(vm)
		}

		repeat {
			type <- 0
			# generate a random number
			# if it is smaller than 0.5 and the VM list is not empty, break from the generation
			if(runif(1) < 0.5 && length(vm) != 0){
				break
			}

			# try three times to find a suitable vm
			for(i in seq(1, 3)){
				type <- sample(length(vmCPU), 1)
				if(myPMCpu - vmCPU[type] >= 0 && myPMMem - vmMEM[type] >= 0){
					# update myPM resources and break out
					myPMCpu <- myPMCpu - vmCPU[type]
					myPMMem <- myPMMem - vmMEM[type]
					vm <- c(vm, type)
					break
				}
			}

			# if it tries three time still not working, break out
			if(type == 0) break

		}
		#cat("finished one pm", '\n')
		#cat('\n')
		# return the vector of vm 
		vm
	}


	generateVMOS <- function(vm, OSProb){
		size <- length(vm)
		#cat("size = ", size, '\n')
		osType <- vector()

		# Three OSs
		if(length(OSProb) == 2){
			for(i in seq(1, size)){
				type <- 0
				r <- runif(1)
				if(r < OSProb[1]) {type <- 1}
				else if(r < OSProb[2] && r >= OSProb[1]) {type <- 2}
				else { type <- 3}
				osType <- c(osType, type)
			}
		
		# Five OSs
		} else if(length(OSProb) == 4){
			for(i in seq(1, size)){
				type <- 0
				r <- runif(1)
				if(r < OSProb[1]) { type <- 1 }
				else if (r < OSProb[2] && r >= OSProb[1]) {type <- 2}
				else if (r < OSProb[3] && r >= OSProb[2]) {type <- 3}
				else if (r < OSProb[4] && r >= OSProb[3]) {type <- 4}
				else {type <- 5}
				osType <- c(osType, type)
			}
		# Two OSs
		} else if(length(OSProb) == 1){
			for(i in seq(1, size)){
				type <- 0
				r <- runif(1)
				if(r < OSProb[1]) type <- 1
				else type <- 2

				osType <- c(osType, type)
			}
		# Four OSs
		} else if(length(OSProb) == 3){
			for(i in seq(1, size)){
				type <- 0
				r <- runif(1)
				if(r < OSProb[1]) { type <- 1 }
				else if (r < OSProb[2] && r >= OSProb[1]) {type <- 2}
				else if (r < OSProb[3] && r >= OSProb[2]) {type <- 3}
				else {type <- 4}
				osType <- c(osType, type)
			}
		# One Os
		} else {
			for(i in seq(1, size)){
				osType <- c(osType, 1)
			}
		}
		osType
	}

	generateContainer <- function(data, vmCPU, vmMEM){
		myCpu <- vmCPU
		myMEM <- vmMEM

		vmCPUOverHeadRate <- 0.1
		vmMemOverhead <- 200

		# subtract the overheads
		myCpu <- myCpu - myCpu * vmCPUOverHeadRate
		myMEM <- myMEM - vmMemOverhead

		containerCpu <- vector()
		containerMem <- vector()
		#data <- read.csv(datasetPath, header = F, sep = ',')
		repeat {
			type <- 0
			# generate a random number 
			# if it is smaller than 0.5 and the container list is not empty, then break from the generation
			if(runif(1) < 0.5 && length(containerCpu) >= 1){
				break
			}

			# try three times to find a suitable container
			for(i in seq(1, 3)){
				type <- 1
				choose <- sample(1:nrow(data), 1)
				choosedCPU <- data[choose, 1]
				choosedMem <- data[choose, 2]

				if(choosedCPU <= myCpu && choosedMem <= myMEM){
					myCpu <- myCpu - choosedCPU
					myMEM <- myMEM - choosedMem
					containerCpu <- c(containerCpu, choosedCPU)
					containerMem <- c(containerMem, choosedMem)
					break
				}
			}

			# this type is only used for checking 
			if(type == 0) break
		}
		# return a matrix
		cbind(containerCpu, containerMem)
	}

	writeFile <- function(pmVM, vmContainers, vmOS, containerMatrix, testCaseSize, testCase){

		base <- paste("./InitEnv/container", testCaseSize, "/testCase", testCase, "/", sep = '')
		if(!file.exists(base)){
			dir.create(base)
		}
		pmFile <- paste(base, "pm.csv", sep='')
		vmFile <- paste(base, "vm.csv", sep='')
		vmOSFile <- paste(base, "/os.csv", sep='')
		containerFile <- paste(base, "container.csv", sep='')

		#cat("vmContainers = ", vmContainers, '\n')
		lapply(X = pmVM, FUN= function(x){
			write(x, append = T, file = pmFile, ncolumns = length(x), sep=',')
		})

		lapply(X = vmContainers, FUN= function(x){
			write(x, append = T, file = vmFile, ncolumns = length(x), sep=',')
		})
		write.table(vmOS, vmOSFile, row.names = F, col.names = F, sep = ',')
		write.table(containerMatrix, containerFile, row.names = F, col.names = F, sep = ',')


		print("Finish")

	}

	# Program starts from here

	# we only use small settings for both PM and VM
	PMCPU <- 13200
	PMMEM <- 16000
	#PMCPU <- 3300
	#PMMEM <- 4000
	#PMCPU <- 6600
	#PMMEM <- 8000

	#datasetPath 
	datasetPath <- './auvergrid.csv'
	#datasetPath <- './bitbrains.csv'

	# Read vm configuration from file
	vmConfig <- read.csv("/home/tanboxi/PH.D_project/data/baseConfig/VMConfig/LVMnePM/VMConfig_twenty.csv", header = F, sep=',')
	vmCPU <- vmConfig[, 1]
	vmMEM <- vmConfig[, 2]

	# Read container configuration from file
	dataset <- read.csv(datasetPath, header=F, sep=',')
	

	OS2Prob <- 0.95
	OS3Prob <- c(0.5, 0.8)
	OS4Prob <- c(0.625, 0.8, 0.95)
	OS5Prob <- c(0.179, 0.633, 0.869, 0.974)

	if(OSNum == 1) OSProb <- 1
	else if(OSNum == 2) OSProb <- OS2Prob
	else if(OSNum == 3) OSProb <- OS3Prob
	else if(OSNum == 4) OSProb <- OS4Prob
	else OSProb <- OS5Prob

	pmSize <- vector()

	# First we generate a number of PMs

	if(testCaseSize == 80){
		# select a random number from [1, 2]
		pmSize <- sample(seq(1, 3), 1)
	} else if(testCaseSize == 200){
		# select a random number from [4, 8]
		pmSize <- sample(seq(4, 8), 1)
	} else if(testCaseSize == 500){
		# select a random number from [8, 16]
		pmSize <- sample(seq(8, 16), 1)
	} else { 
		# 1000 containers
		pmSize <- sample(seq(16, 32), 1)
	}

	pmVM <- list()
	globalContaienrCount <- 1
	globalVMCount <- 1
	vmContainers <- list()
	vmOS <- vector()
	containerMatrix <- vector()

	#cat('pmSize = ', pmSize, '\n')
	# for each pm, generate its vm list
	for(eachPM in seq(1, pmSize)){
		#cat('eachPM = ', eachPM, '\n')
		vms <- generateVMtype(vmCPU, vmMEM, PMCPU, PMMEM, OSNum)
		#cat('vms = ', vms, '\n')
		os <- generateVMOS(vms, OSProb)
		#cat('os = ', os, '\n')

		#print('generated VMs and OSs')


		# for each vm, generate its container list
		for(eachVM in seq(1, length(vms))){

			#('prepare to generate containers')
			containers <- generateContainer(dataset, vmCPU[vms[eachVM]], vmMEM[vms[eachVM]])
			#print('generated containers')


			# calculate how many container does this VM hold
			num <- nrow(containers)
			containerList <- seq(globalContaienrCount, num + globalContaienrCount - 1)
			#cat("containerList = ", containerList, '\n')
			globalContaienrCount <- globalContaienrCount + num
			
			#print('collect the container pointers/indexes')
			vmContainers[[globalVMCount]] <- containerList

			#print('collect the container resources')
			containerMatrix <- rbind(containerMatrix, containers)
			globalVMCount <- globalVMCount + 1

		} # for ends


		#print('prepare to collect data')
		# collect the VM points
		pmVM[[eachPM]] <- vms
		vmOS <- c(vmOS, os)
		#cat("pmVM = ", vms, "\n")

		#print('collected the data')
	}
	
	#print("Ready to save to file")
	# save to file
	writeFile(pmVM, vmContainers, vmOS, containerMatrix, testCaseSize, testCase)
	#print("Saved to files")

}
