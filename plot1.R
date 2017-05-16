  png(file="plot1.png")
    library(data.table)
    Dh <- fread("household_power_consumption.txt",na="?")
    Dh$Date <- as.Date(strptime(Dh$Date,"%d/%m/%Y"))
    Dh <- Dh[Date >= as.Date(strptime("2007-02-01","%Y-%m-%d")) & 
             Date <= as.Date(strptime("2007-02-02","%Y-%m-%d")),]
    hist(Dh$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()