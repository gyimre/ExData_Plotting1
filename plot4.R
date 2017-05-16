    png(file="plot4.png")
    library(data.table)
    Dh <- fread("household_power_consumption.txt",na="?")
    Dh$Date <- as.Date(strptime(Dh$Date,"%d/%m/%Y"))
    Dh <- Dh[Date >= as.Date(strptime("2007-02-01","%Y-%m-%d")) & 
             Date <= as.Date(strptime("2007-02-02","%Y-%m-%d")),]
    attach(Dh)
    Sys.setlocale("LC_TIME","English")
    par(mfrow=c(2,2))    
    #1
    plot(Global_active_power, pch="", ylab="Global Active Power (kilowatts)", xlab="",xaxt="n")
    axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
    lines(Global_active_power)
    #2
    plot(Voltage, pch="", ylab="Voltage", xlab="datetime",xaxt="n")
    axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
    lines(Voltage)
    #3
    plot(Sub_metering_1, pch="", ylab="Energy sub metering", xlab="",xaxt="n")
    axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
    lines(Sub_metering_1,col="black")
    lines(Sub_metering_2,col="red")
    lines(Sub_metering_3,col="blue")        
    legend("topright", legend=c("Sub metering_1","Sub metering_2","Sub metering_3")
        ,lty=c(1,1,1) ,lwd=c(2.5,2.5,2.5) ,col=c("black","red","blue"))
    #4
    plot(Global_reactive_power, pch="", ylab="Global_reactive_power", xlab="datetime",xaxt="n")
    axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
    lines(Global_reactive_power)
    #    
    detach(Dh)
    dev.off()