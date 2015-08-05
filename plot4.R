library(lubridate) #use lubridate for intuitive date processing
#read data from Feb-1-2007 to Feb-2-2007 only
hpc <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=FALSE, sep=";",skip=66637,nrows=2880,stringsAsFactors = FALSE)
#read in file header to get variable names
header <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=TRUE, sep=";",nrows=1,stringsAsFactors = FALSE)
names(hpc)<-names(header)
#combine Date and Time into a datetime vector "dt"
datetime<-parse_date_time(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
#open png file of correct size
png("plot4.png",width=480,height=480)
#set graph for four plots in 2 rows and 2 cols, fill by cols
par(mfcol=c(2,2))
#plot Global_active_power for time period of interest
plot(dt,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot submetering data as three lines on same graph
plot(dt,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(dt,hpc$Sub_metering_2,col="red")
lines(dt,hpc$Sub_metering_3,col="blue")
#add legend
n<-names(hpc[,7:9])
legend("topright",n,lty=c(1,1,1),col=c("black","red","blue"))
#plot voltage for time period of interest
plot(datetime,hpc$Voltage,ylab="Voltage",type="l")
#plot global reactive power for period of interest
plot(datetime,hpc$Global_reactive_power,ylab="Global_reactive_power",type="l")
dev.off()