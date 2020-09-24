library(nsga2R)
library(mco)

cat("Usage: bestFront(algorithm = 'multiGroupGA', numOfVm = 'ten', numOfApp=50)\n")
bestFront <- function(algorithm='multiGroupGA', numOfVm='ten', numOfApp = 50){

	best_front <- function(data){
		temp <- unique(data[, 1:2])
		temp <- temp[complete.cases(temp), ]
		front <- vector()
		best_front <- vector()
		ranking <- fastNonDominatedSorting(temp)
		rnkIndex <- integer()
		i <- 1
		while(i <= length(ranking)){
			rnkIndex[ranking[[i]]] <- i
			i <- i + 1
		}
		front <- cbind(temp, rnkIndex)
		best_front <- front[front[, 3] == 1, 1:2]

		if(as.logical(match(1, best_front[, 2], nomatch = 0))){
			best_front <- best_front[-which(best_front[, 2] == 1), ]
		}
		if(as.logical(match(1, best_front[, 1], nomatch = 0))){
			best_front<- best_front[-which(best_front[, 1] == 1), ]
		}
		best_front
	}

	path <- paste("../", algorithm, "/", numOfVm, "/app", numOfApp, "/allResults.csv", sep = '')
	front_filename <- paste("../", algorithm, "/", numOfVm, "/app", numOfApp, "/bestFront.csv", sep = '')
	data <- read.csv(path, header=F, sep=',')
	front <- best_front(data)
	write.table(front, front_filename, row.names = F, col.names = F, quote = F, sep=',')
	#foreach(i = 1:iter) %dopar% {
		#iterDirect <- paste(path, i, '/', sep = '')
		#for(j in 1:maxgen){
			#genDirect <- paste(iterDirect, j, '/', sep = '')
			#filename <- paste(genDirect, 'fitness.csv', sep='')
			#front_filename <- paste(genDirect, 'front.csv', sep='')
			#data <- read.csv(filename, header = T, sep = ',')
			#front <- best_front(data)
			##names(front) <- c("costF", "latencyF")
			#write.table(front, front_filename, row.names = F, col.names = F, quote = F, sep=',')
		#}
	#}
	
	print("Finished")

}


