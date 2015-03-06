temp<-read.csv("household_power_consumption.txt",sep=';',colClasses=c('character','character','character','character','character','character','character','character','character'))
data<-temp[temp$Date=="1/2/2007"|temp$Date=="2/2/2007",]

data$Date=paste(data$Date,data$Time)
data$Date<-strptime(data$Date,"%d/%m/%Y %H:%M:%S")

data$Time<-weekdays(data$Date)
colnames(data)[2]<-'Day'

for(i in 3:9){
data[[i]]<-as.numeric(data[[i]])}

hist(data$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dev.copy(png,filename='Plot1.png',width=480,height=480)
dev.off()
