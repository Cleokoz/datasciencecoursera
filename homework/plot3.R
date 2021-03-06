plot3 <- function() {

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
png(filename="./plot3.png",width = 480, height = 480, units = "px")

plot(d$DateTime,d$Sub_metering_1,type="l",main="",xlab = "",ylab = "Energy sub metering",col="black")
lines(d$DateTime,d$Sub_metering_2,type="l",col="red")
lines(d$DateTime,d$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col=c("black","red","blue"),lty=1);

dev.off()
}