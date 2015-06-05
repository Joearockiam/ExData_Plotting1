setwd("C:\\Datascience")
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

#plot the graph
hist(assignData$Global_active_power,main="Global Active Power",xlab = "Global Active Power(kilowatts)", col="red")

