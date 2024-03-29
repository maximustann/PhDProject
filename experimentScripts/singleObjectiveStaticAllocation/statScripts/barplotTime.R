library(ggplot2)
cat("Usage: barplotTime(vmSize = 'twenty') \n")
barplotTime <- function(vmSize = 'twenty'){
	base <- "../"
	alg1 <- "ffBfFF"
	alg2 <- "cecGA"
	alg3 <- "dualPermutationNF"
	alg4 <- "dualPermutationFF"
	alg5 <- "groupGA"

	alg1_200Path <- paste(base, alg1, "/", vmSize, "/Container", 200, "/time.csv", sep="")
	alg1_500Path <- paste(base, alg1, "/", vmSize,  "/Container",500, "/time.csv", sep="")
	alg1_1000Path <- paste(base, alg1, "/", vmSize, "/Container", 1000, "/time.csv", sep="")
	alg1_1500Path <- paste(base, alg1, "/", vmSize, "/Container", 1500, "/time.csv", sep="")

	alg2_200Path <- paste(base, alg2, "/", vmSize, "/Container", 200, "/time.csv", sep="")
	alg2_500Path <- paste(base, alg2, "/", vmSize, "/Container", 500, "/time.csv", sep="")
	alg2_1000Path <- paste(base, alg2, "/", vmSize, "/Container", 1000, "/time.csv", sep="")
	alg2_1500Path <- paste(base, alg2, "/", vmSize, "/Container", 1500, "/time.csv", sep="")

	alg3_200Path <- paste(base, alg3, "/", vmSize, "/Container", 200, "/time.csv", sep="")
	alg3_500Path <- paste(base, alg3, "/", vmSize, "/Container", 500, "/time.csv", sep="")
	alg3_1000Path <- paste(base, alg3, "/", vmSize, "/Container", 1000, "/time.csv", sep="")
	alg3_1500Path <- paste(base, alg3, "/", vmSize, "/Container", 1500, "/time.csv", sep="")

	alg4_200Path <- paste(base, alg4, "/", vmSize, "/Container", 200, "/time.csv", sep="")
	alg4_500Path <- paste(base, alg4, "/", vmSize, "/Container", 500, "/time.csv", sep="")
	alg4_1000Path <- paste(base, alg4, "/", vmSize, "/Container", 1000, "/time.csv", sep="")
	alg4_1500Path <- paste(base, alg4, "/", vmSize, "/Container", 1500, "/time.csv", sep="")

	alg5_200Path <- paste(base, alg5, "/", vmSize, "/Container", 200, "/time.csv", sep="")
	alg5_500Path <- paste(base, alg5, "/", vmSize, "/Container", 500, "/time.csv", sep="")
	alg5_1000Path <- paste(base, alg5, "/", vmSize, "/Container", 1000, "/time.csv", sep="")
	alg5_1500Path <- paste(base, alg5, "/", vmSize, "/Container", 1500, "/time.csv", sep="")

	alg1_200 <- mean(unlist(read.csv(alg1_200Path, header=F, sep=',')[, 1]))
	alg1_500 <- mean(unlist(read.csv(alg1_500Path, header=F, sep=',')[, 1]))
	alg1_1000 <- mean(unlist(read.csv(alg1_1000Path, header=F, sep=',')[, 1]))
	alg1_1500 <- mean(unlist(read.csv(alg1_1500Path, header=F, sep=',')[, 1]))

	alg2_200 <- mean(unlist(read.csv(alg2_200Path, header=F, sep=',')[, 1]))
	alg2_500 <- mean(unlist(read.csv(alg2_500Path, header=F, sep=',')[, 1]))
	alg2_1000 <- mean(unlist(read.csv(alg2_1000Path, header=F, sep=',')[, 1]))
	alg2_1500 <- mean(unlist(read.csv(alg2_1500Path, header=F, sep=',')[, 1]))

	alg3_200 <- mean(unlist(read.csv(alg3_200Path, header=F, sep=',')[, 1]))
	alg3_500 <- mean(unlist(read.csv(alg3_500Path, header=F, sep=',')[, 1]))
	alg3_1000 <- mean(unlist(read.csv(alg3_1000Path, header=F, sep=',')[, 1]))
	alg3_1500 <- mean(unlist(read.csv(alg3_1500Path, header=F, sep=',')[, 1]))

	alg4_200 <- mean(unlist(read.csv(alg4_200Path, header=F, sep=',')[, 1]))
	alg4_500 <- mean(unlist(read.csv(alg4_500Path, header=F, sep=',')[, 1]))
	alg4_1000 <- mean(unlist(read.csv(alg4_1000Path, header=F, sep=',')[, 1]))
	alg4_1500 <- mean(unlist(read.csv(alg4_1500Path, header=F, sep=',')[, 1]))

	alg5_200 <- mean(unlist(read.csv(alg5_200Path, header=F, sep=',')[, 1]))
	alg5_500 <- mean(unlist(read.csv(alg5_500Path, header=F, sep=',')[, 1]))
	alg5_1000 <- mean(unlist(read.csv(alg5_1000Path, header=F, sep=',')[, 1]))
	alg5_1500 <- mean(unlist(read.csv(alg5_1500Path, header=F, sep=',')[, 1]))


	time <- c(alg1_200, alg1_500, alg1_1000, alg1_1500,
				alg2_200, alg2_500, alg2_1000, alg2_1500,
				alg3_200, alg3_500, alg3_1000, alg3_1500,
				alg4_200, alg4_500, alg4_1000, alg4_1500,
				alg5_200, alg5_500, alg5_1000, alg5_1500)

	algorithm <- factor(c(rep("FF&BF/FF", 4), rep("SGA", 4), rep("DGA-NF", 4), rep("DGA-FF", 4), rep("GGA-RAC", 4)), levels=c("FF&BF/FF", "SGA","DGA-NF", "DGA-FF", "GGA-RAC"))
	containerSize <- rep(c(200, 500, 1000, 1500), 5)

	data <- data.frame(time=time, algorithm=algorithm, containerSize=containerSize)
	p <- ggplot(data, aes(x=containerSize, y=time)) + 
		geom_bar(stat="identity", width=100, aes(fill=algorithm), position=position_dodge()) + 
		scale_fill_brewer(palette="Set1") +
		scale_x_discrete(limits=c(200, 500, 1000, 1500)) + 
		xlab("Container size") + 
		ylab("Time (s)") + 
		theme(axis.text = element_text(size=40, face="bold"), 
		legend.text = element_text(size=40, face="bold"), 
		legend.title = element_blank(), 
		axis.title = element_text(size=40, face = "bold"), 
		legend.position = "bottom")

	p
	ggsave(paste("../computation_time/",vmSize, "_time.png" ,sep=''), height=10, width=15)
	ggsave(paste("../computation_time/",vmSize, "_time.eps" ,sep=''), height=10, width=15)
}
