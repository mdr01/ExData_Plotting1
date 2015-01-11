dataFile<-"household_power_consumption.txt"
dat<-read.csv(dataFile,sep=";")#,colClasses=c("Date",NA)) #"Date","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric"))
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(strptime(dat$Time,format="%H:%M:%S"),"%H:%M")

dat1<-dat[dat$Date=="2007-02-01",]
dat2<-dat[dat$Date=="2007-02-02",]

dat3<-rbind(dat1,dat2)

hist(as.numeric(dat3$Global_active_power),xlab="Global Active Power (killowatts)",main="Global Active Power",col="red")

dev.copy(png, file = "plot1.png")
dev.off() 
