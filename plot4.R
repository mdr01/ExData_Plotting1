dataFile<-"household_power_consumption.txt"
dat<-read.csv(dataFile,sep=";")#,colClasses=c("Date",NA)) #"Date","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric"))
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat$Time<-format(strptime(dat$Time,format="%H:%M:%S"),"%H:%M")

dat1<-dat[dat$Date=="2007-02-01",]
dat2<-dat[dat$Date=="2007-02-02",]

dat3<-rbind(dat1,dat2)

par(mfrow = c(2, 2))

#1
plot(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Global_active_power),type="l",
     col="black",xlab="",ylab="Global Active Power (killowatts)")

#2
plot(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Voltage),type="l",
     col="black",xlab="datetime",ylab="Voltage")

#3
plot(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering")
lines(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_2),col="red")
lines(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Sub_metering_3),col="blue")
legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#4
plot(as.POSIXlt(paste(dat3$Date,dat3$Time)),as.numeric(dat3$Global_reactive_power),type="l",
     col="black",xlab="datetime",ylab="Global_reactive_power")



dev.copy(png, file = "plot4.png")
dev.off() 



