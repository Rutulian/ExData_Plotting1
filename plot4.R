#download file and read into a dataframe
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Proj1Data.zip")
input <- unz("Proj1Data.zip","household_power_consumption.txt")
df <- read.table(input,header=TRUE,na.strings="?",sep=";")

#parse date/time and subset to dates required
df$Date <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df=subset(df, Date >= "2007-02-01" & Date < "2007-02-03") 
#when using Date<=2007-02-02 I lost all data after 00:00 on 2007-02-02

#Open graphics device and set up grid
png(file="plot4.png")
par(mfcol=c(2,2))

#First plot
plot(df$Date,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Second plot
plot(df$Date,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$Date,df$Sub_metering_2,col="red")
lines(df$Date,df$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

#Third plot
plot(df$Date,df$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Fourth plot
plot(df$Date,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#Close graphics device
dev.off()