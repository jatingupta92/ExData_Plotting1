temp<-read.csv("household_power_consumption.txt",sep=';',colClasses=c('character','character','character','character','character','character','character','character','character'))
data<-temp[temp$Date=="1/2/2007"|temp$Date=="2/2/2007",]

data$Date=paste(data$Date,data$Time)
data$Date<-strptime(data$Date,"%d/%m/%Y %H:%M:%S")

data$Time<-weekdays(data$Date)
colnames(data)[2]<-'Day'

for(i in 3:9){
  data[[i]]<-as.numeric(data[[i]])}

with(subset(data,Day=="Thursday"|Day=="Friday"|Day=="Saturday"),plot(Date,Global_active_power,type='n',xlab="",ylab="Global Active Power(kilowatts)"))
with(subset(data,Day=="Thursday"|Day=="Friday"|Day=="Saturday"),lines(Date,Global_active_power))

dev.copy(png,filename='Plot2.png',width=480,height=480)
dev.off()
