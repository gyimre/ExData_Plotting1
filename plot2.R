   png(file="plot2.png")
    library(data.table)
    Dh <- fread("household_power_consumption.txt",na="?")
    Dh$Date <- as.Date(strptime(Dh$Date,"%d/%m/%Y"))
    Dh <- Dh[Date >= as.Date(strptime("2007-02-01","%Y-%m-%d")) & 
             Date <= as.Date(strptime("2007-02-02","%Y-%m-%d")),]
    attach(Dh)
    Sys.setlocale("LC_TIME","English")
    plot(Global_active_power, pch="", ylab="Global Active Power (kilowatts)",
        xlab="",xaxt="n")
    axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
    lines(Global_active_power)
    dev.off()