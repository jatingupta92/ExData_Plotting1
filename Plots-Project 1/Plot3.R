temp<-read.csv("household_power_consumption.txt",sep=';',colClasses=c('character','character','character','character','character','character','character','character','character'))
data<-temp[temp$Date=="1/2/2007"|temp$Date=="2/2/2007",]

data$Date=paste(data$Date,data$Time)
data$Date<-strptime(data$Date,"%d/%m/%Y %H:%M:%S")

data$Time<-weekdays(data$Date)
colnames(data)[2]<-'Day'

for(i in 3:9){
  data[[i]]<-as.numeric(data[[i]])}

with(subset(data,Day=="Thursday"|Day=="Friday"|Day=="Saturday"),plot(Date,Sub_metering_1,type='n',xlab="",ylab='Energy sub metering'))
with(subset(data,Day=="Thursday"|Day=="Friday"|Day=="Saturday"),{
lines(Date,Sub_metering_1)
lines(Date,Sub_metering_2,col='red')
lines(Date,Sub_metering_3,col='blue')})
legend("topright",legend=c('Sub_metering_1     ','Sub_metering_2     ','Sub_metering_3     '),lty='solid',col=c('black','red','blue'),cex=0.7)

dev.copy(png,filename='Plot3.png',width=480,height=480)
dev.off()
