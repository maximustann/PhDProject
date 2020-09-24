
vmDist <- function(base, run){
	vmTypeDist <- rep(0, 10)
	for(i in seq(0, 29)){
		vmTypeDist <- vmTypeDist + vmDistRun(base, i, run)
	}
	vmTypeDist <- vmTypeDist / 30
	vmTypeDist
}

vmDistRun <- function(base, simulation, run){
	
	vmTypeRun <- rep(0, 10)
	for(i in seq(0, run - 1)){
		if(run > 1){
			dirBase <- paste(base, 'evo', i, '/', simulation, sep='')
		} else {
			dirBase <- paste(base, simulation, sep='')
		}
		fileName <- paste(dirBase,  '/pmStatus.csv', sep='')
		data <- read.csv(fileName, header=F, sep=',')
		pmNum <- nrow(data)
		vmNum <- sum(data[, 8])
		vmTypeRun <- vmTypeRun + vmDistSim(dirBase, pmNum, vmNum)
	}

	vmTypeRun <- vmTypeRun / run
	vmTypeRun
}

vmDistSim <- function(base, pmNum, vmNum){
	vmType <- rep(0, 10)
	for(i in seq(pmNum)){
		fileName <- paste(base, '/vm/pm_', i, '.csv', sep='')
		data <- read.csv(fileName, header=F, sep=',')[, 8]
		for(j in data){
			vmType[j + 1] <- vmType[j + 1] + 1
		}
	}
	vmType <- vmType / vmNum
	#print(vmType)
	vmType
}

vmDistSingleRun <- function(base, run){
	vmType <- rep(0, 10)
	for(i in seq(0, 29)){
		dirBase <- paste(base, 'evo', run, '/', i, sep='')
		fileName <- paste(dirBase, '/pmStatus.csv', sep='')
		data <- read.csv(fileName, header=F, sep=',')
		pmNum <- nrow(data)
		vmNum <- sum(data[, 8])
		vmType<- vmType+ vmDistSim(dirBase, pmNum, vmNum)
	}
	vmType<- vmType/ 30
	vmType
}
