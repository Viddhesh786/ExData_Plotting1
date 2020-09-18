data1 <- read.delim("C:/Users/Shruti Sankhe/Desktop/Data Analytics/household_power_consumption.txt",sep=";")

data1$DateTime <- as.POSIXct(strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S"))

data1$Date <- as.Date(data1$Date,format="%d/%m/%Y")

data1 <- subset(data1, Date=="2007-02-01" | Date=="2007-02-02")
library(dplyr)
data1 <- data1 %>% mutate_if(is.factor,as.character)

data1 <- data1 %>% mutate_if(is.character,as.numeric)

data1 <- data1 %>% mutate_if(is.character,as.numeric)



png("C:/Users/Shruti Sankhe/Desktop/Data Analytics/ExData_Plotting1/plot3.png",width=480,height=480)
plot(x=data1$DateTime,y=data1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=data1$DateTime,y=(data1$Sub_metering_2),col="red")
lines(x=data1$DateTime,y=data1$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()
