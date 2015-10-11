# To read data into R taking missing variables into account
Data <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
str(Data) 

#To convert Date variable to Date class function
Data$Date <-as.Date(Data$Date, format= "%d/%m/%Y") 

#To subset the Data for only two days
Data07 <- subset(Data, Date>= "2007-02-01" & Date<="2007-02-02") 
str(Data07)

#To convert Time variable into POSIXIt variable

Data07$timetemp<-paste(Data07$Date, Data07$Time) 
str(Data07$timetemp) 

Data07$Time <-strptime(Data07$timetemp, format = "%Y-%m-%d %H:%M:%S")
str(Data07)

Data07<-Data07[, 1:9] #to tidy data 
str(Data07)

#Plot#4
png(file= "plot4.png", width = 480, height = 480, units= "px")
par(mfrow=c(2,2))
plot(Data07$Time, Data07$Global_active_power, type = "l", ylab = 'Global Active Power', xlab = "")#plot1

plot(Data07$Time, Data07$Voltage, type = "l", ylab = 'Voltage', xlab = "datetime") #plot2

plot(Data07$Time, Data07$Sub_metering_1,type = "l", ylab = 'Energy sub metering', xlab = '')
par(new=T)
plot(Data07$Time, Data07$Sub_metering_2,type="l",ylim = c(0.0, 40.0), col="red", xlab = '', ylab = '', axes=F)
par(new=T)
plot(Data07$Time, Data07$Sub_metering_3,type="l",ylim = c(0.0, 40.0), col="blue", xlab = '', ylab = '', axes=F)
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), bty="n", lty=c(1,1,1))
par(new=F)

plot(Data07$Time, Data07$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime") #plot4

dev.off(2)
