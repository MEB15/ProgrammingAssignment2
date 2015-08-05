#read data from Feb-1-2007 to Feb-2-2007 only
hpc <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=FALSE, sep=";",skip=66637,nrows=2880,stringsAsFactors = FALSE)
#read in file header to get variable names
header <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=TRUE, sep=";",nrows=1,stringsAsFactors = FALSE)
names(hpc)<-names(header)
#plot histogram of Global_active_power
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
#copy histogram to png file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
