setwd("C:\\Datascience")
#read txt data file 
assignData<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,skip=66636,nrow=2880)

#assign name to each column
names(assignData)[1]<-'Date'
names(assignData)[2]<-'Time'
names(assignData)[3]<-'Global_active_power'
names(assignData)[4]<-'Global_reactive_power'
names(assignData)[5]<-'Voltage'
names(assignData)[6]<-'Global_intensity'
names(assignData)[7]<-'Sub_metering_1'
names(assignData)[8]<-'Sub_metering_2'
names(assignData)[9]<-'Sub_metering_3'

# convert date and time variables
assignData$Time <- strptime(paste(assignData$Date, assignData$Time), "%d/%m/%Y %H:%M:%S")
assignData$Date <- as.Date(assignData$Date, "%d/%m/%Y")

#set the 2 rows and 2 columns for the graphs
par(mfrow=c(2,2))
#plot 1
plot(x=assignData$Time,y=assignData$Global_active_power,ylab="Global Active Power(kilowatts)", type="l",xlab="")

#plot 2
plot(x=assignData$Time,y=assignData$Voltage,type="l",xlab="datetime", ylab="Voltage")

#plot 3
plot(assignData$Time, assignData$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering") 
lines(assignData$Time, assignData$Sub_metering_2, col="red")
lines(assignData$Time,assignData$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1),
       bty="n",
       cex=.5,
       box.lwd=0)

#plot 4
plot(assignData$Time, assignData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

