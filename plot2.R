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

#Plot2
png(file= "plot2.png", width = 480, height = 480, units= "px")
plot(Data07$Time, Data07$Global_active_power, type = "l", ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off(2)