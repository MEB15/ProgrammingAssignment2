library(lubridate) #use lubridate for intuitive date processing
#read data from Feb-1-2007 to Feb-2-2007 only
hpc <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=FALSE, sep=";",skip=66637,nrows=2880,stringsAsFactors = FALSE)
#read in file header to get variable names
header <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=TRUE, sep=";",nrows=1,stringsAsFactors = FALSE)
names(hpc)<-names(header)
#combine Date and Time into a datetime vector "dt"
dt<-parse_date_time(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
#open png file of correct size
png("plot3.png",width=480,height=480)
#plot submetering data as three lines on same graph
plot(dt,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(dt,hpc$Sub_metering_2,col="red")
lines(dt,hpc$Sub_metering_3,col="blue")
#add legend
n<-names(hpc[,7:9])
legend("topright",n,lty=c(1,1,1),col=c("black","red","blue"))
#close png device
dev.off()
