data1 <- read.delim("C:/Users/Shruti Sankhe/Desktop/Data Analytics/household_power_consumption.txt",sep=";")

data1$DateTime <- as.POSIXct(strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S"))

data1$Date <- as.Date(data1$Date,format="%d/%m/%Y")

data1 <- subset(data1, Date=="2007-02-01" | Date=="2007-02-02")
library(dplyr)


data1 <- data1 %>% mutate_if(is.factor,as.character)

data1 <- data1 %>% mutate_if(is.character,as.numeric)

data1 <- data1 %>% mutate_if(is.character,as.numeric)



png("C:/Users/Shruti Sankhe/Desktop/Data Analytics/ExData_Plotting1/plot1.png",width=480,height=480)
hist(data1$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()



