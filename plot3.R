dataFile<-"household_power_consumption.txt"
dat<-read.csv(dataFile,sep=";")#,colClasses=c("Date",NA)) #"Date","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric"))
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(strptime(dat$Time,format="%H:%M:%S"),"%H:%M")

dat1<-dat[dat$Date=="2007-02-01",]
dat2<-dat[dat$Date=="2007-02-02",]

dat3<-rbind(dat1,dat2)

plot(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering")
lines(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_2),col="red")
lines(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_3),col="blue")

legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.copy(png, file = "plot3.png")
dev.off() 


