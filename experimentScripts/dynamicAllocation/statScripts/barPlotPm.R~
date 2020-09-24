library(ggplot2)
library(reshape2)

cat('Usage: barPlotPm(type: 1 = remain, 2 = util) \n')
barPlotPm <- function(type=1){

	if(type != 1 && type != 2){
		cat("type should be 1 or 2! \n")
		return
	}

	pmCpu <- 13200
	pmMem <- 16000
	choice <- c('pmRemain.csv', 'pmUtil.csv')
	name <- c("Remaining", "Utilization")
	ylegend <- c(0.4, 0.2)
	base <- "/local/scratch/tanboxi/containerAllocationResults/twoLevels/"
	containerRealTenpath <- paste(base, 'Container2500_realData_smallPM_OS5_tenVM/', choice[type], sep='')
	containerBalanceTenpath <- paste(base, 'Container2500_balanced_smallPM_OS5_tenVM/', choice[type], sep='')
	containerRealTwentypath <- paste(base, 'Container2500_realData_smallPM_OS5_twentyVM/', choice[type], sep='')
	containerBalanceTwentypath <- paste(base, 'Container2500_balanced_smallPM_OS5_twentyVM/', choice[type], sep='')

	containerRealTen <- read.csv(containerRealTenpath, header=F, sep=',')
	containerBalanceTen <- read.csv(containerBalanceTenpath, header=F, sep=',')
	containerRealTwenty <- read.csv(containerRealTwentypath, header=F, sep=',')
	containerBalanceTwenty <- read.csv(containerBalanceTwentypath, header=F, sep=',')

	
	justFitSubRealTencpu <- containerRealTen[1, 1] / 13200 * 100
	justFitSubRealTenmem <- containerRealTen[1, 3] / 16000 * 100

	justFitSubBalanceTencpu <- containerBalanceTen[1, 1] / 13200 * 100
	justFitSubBalanceTenmem <- containerBalanceTen[1, 3] / 16000 * 100

	justFitSubRealTwentycpu <- containerRealTwenty[1, 1] / 13200 * 100
	justFitSubRealTwentymem <- containerRealTwenty[1, 3] / 16000 * 100

	justFitSubBalanceTwentycpu <- containerBalanceTwenty[1, 1] / 13200 * 100
	justFitSubBalanceTwentymem <- containerBalanceTwenty[1, 3] / 16000 * 100
	
	evoOneRealTencpu <- containerRealTen[2, 1] / 13200 * 100
	evoOneRealTenmem <- containerRealTen[2, 3] / 16000 * 100

	evoOneBalanceTencpu <- containerBalanceTen[2, 1] / 13200 * 100
	evoOneBalanceTenmem <- containerBalanceTen[2, 3] / 16000 * 100

	evoOneRealTwentycpu <- containerRealTwenty[2, 1] / 13200 * 100
	evoOneRealTwentymem <- containerRealTwenty[2, 3] / 16000 * 100

	evoOneBalanceTwentycpu <- containerBalanceTwenty[2, 1] / 13200 * 100
	evoOneBalanceTwentymem <- containerBalanceTwenty[2, 3] / 16000 * 100

	evoTwoRealTencpu <- containerRealTen[3, 1] / 13200 * 100
	evoTwoRealTenmem <- containerRealTen[3, 3] / 16000 * 100


	evoTwoBalanceTencpu <- containerBalanceTen[3, 1] / 13200 * 100
	evoTwoBalanceTenmem <- containerBalanceTen[3, 3] / 16000 * 100


	evoTwoRealTwentycpu <- containerRealTwenty[3, 1] / 13200 * 100
	evoTwoRealTwentymem <- containerRealTwenty[3, 3] / 16000 * 100

	evoTwoBalanceTwentycpu <- containerBalanceTwenty[3, 1] / 13200 * 100
	evoTwoBalanceTwentymem <- containerBalanceTwenty[3, 3] / 16000 * 100
	
	algorithm <- c(rep("X", 4), rep("Y", 4), rep("Z", 4))
	cpu <- c(justFitSubRealTencpu, justFitSubBalanceTencpu, justFitSubRealTwentycpu, justFitSubBalanceTwentycpu, evoOneRealTencpu, evoOneBalanceTencpu, evoOneRealTwentycpu, evoOneBalanceTwentycpu, evoTwoRealTencpu, evoTwoBalanceTencpu, evoTwoRealTwentycpu, evoTwoBalanceTwentycpu)

	mem <- c(justFitSubRealTenmem, justFitSubBalanceTenmem, justFitSubRealTwentymem, justFitSubBalanceTwentymem, evoOneRealTenmem, evoOneBalanceTenmem, evoOneRealTwentymem, evoOneBalanceTwentymem, evoTwoRealTenmem, evoTwoBalanceTenmem, evoTwoRealTwentymem, evoTwoBalanceTwentymem)

	x_axis <- c("a", "b", "c", "d")
	data <- data.frame(x=x_axis, y = cpu, algorithm)
	p <- ggplot(data, aes(x=x, y=y)) + geom_bar(stat="identity", width=0.3, aes(fill=algorithm), position=position_dodge()) + scale_x_discrete(labels=c('3', '6', '9', '12')) + scale_fill_manual( values=c("#fa9d22", "#86b3dd", "#812c2c"), labels=c("sub&Just-Fit/FF", "evo/FF", "evo/evo")) + xlab("scenario") + ylab(paste("Average PM CPU ", name[type], " (%)",sep='')) + 
	theme(panel.background = element_rect(fill='#eaeaea'), panel.grid.minor=element_line(color='#4d5566'), panel.grid.major=element_line(color='#bdbdbd'), plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(size=50, hjust = 0.5, face="bold"), axis.text.x = element_text(size=40), axis.text.y=element_text(size=40, angle=90), legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=40))
	
		#theme(axis.text = element_text(size = 30, face = "bold"), legend.text = element_text(size=45, face="bold"), legend.title = element_text(""), axis.title = element_text(size=40, face="bold"), legend.position=c(0.3, ylegend[type]))

	p
	ggsave(paste('../cpu', name[type], '.png', sep=''), height=15, width=15)
	ggsave(paste('../cpu', name[type], '.eps', sep=''), height=15, width=15)


	data <- data.frame(x=x_axis, y = mem, algorithm)
	d <- ggplot(data, aes(x=x, y=y)) + geom_bar(stat="identity", width=0.3, aes(fill=algorithm), position=position_dodge()) + scale_x_discrete(labels=c('3', '6', '9', '12')) + scale_y_continuous(breaks=seq(from=0, to=100, by=10))+scale_fill_manual(values=c("#fa9d22", "#86b3dd", "#812c2c"), labels=c("sub&Just-Fit/FF", "evo/FF", "evo/evo")) + xlab("scenario") + ylab(paste("Average PM Memory ", name[type], " (%)",sep='')) + 
	theme(panel.background = element_rect(fill='#eaeaea'), panel.grid.minor=element_line(color='#4d5566'), panel.grid.major=element_line(color='#bdbdbd'), plot.title=element_text(size=50), axis.title=element_text(size=50, color='#555555'), axis.title.y=element_text(vjust=1, angle=90, face="bold"), axis.title.x = element_text(size=50, hjust = 0.5, face="bold"), axis.text.x = element_text(size=40), axis.text.y=element_text(size=40, angle=90), legend.position="bottom", legend.title=element_blank(), legend.text=element_text(size=40))
	
		#theme(axis.text = element_text(size = 30, face = "bold"), legend.text = element_text(size=45, face="bold"), legend.title = element_text(""), axis.title = element_text(size=40, face="bold"), legend.position=c(0.3, ylegend[type]))

	d
	ggsave(paste('../mem', name[type], '.png', sep=''), height=15, width=15)
	ggsave(paste('../mem', name[type], '.eps', sep=''), height=15, width=15)

}

