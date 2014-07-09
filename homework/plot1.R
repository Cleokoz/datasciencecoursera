plot1 <- function() {

####################### reading in data  
## not reading entire txt file just to speed up loading
d<-read.table("household_power_consumption.txt",nrows=5000,skip=66000,sep=";")

## this is to read in the names of the columns
x<-read.table("household_power_consumption.txt",nrows=1,sep=";")
names(d)<-as.matrix(x)

## backup
d2<-d

## make another column with date and time so that we can choose correct subset
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S") 
d<- subset(d, DateTime > as.POSIXct('2007-02-01 0:0:0') & DateTime <= as.POSIXct('2007-02-03 0:0:0')  )

######################plot
plot.new()
png(filename="./plot1.png",width = 480, height = 480, units = "px")

hist(d$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
}