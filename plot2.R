library(lubridate) #use lubridate for intuitive date processing
#read data from Feb-1-2007 to Feb-2-2007 only
hpc <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=FALSE, sep=";",skip=66637,nrows=2880,stringsAsFactors = FALSE)
#read in file header to get variable names
header <- read.csv("~/Coursera/Exploratory_Data_Analysis/project1/household_power_consumption.txt", header=TRUE, sep=";",nrows=1,stringsAsFactors = FALSE)
names(hpc)<-names(header)
#combine Date and Time into a datetime vector "dt"
dt<-parse_date_time(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
#plot Global_active_power for time period of interest
plot(dt,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#copy plot to png file
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
