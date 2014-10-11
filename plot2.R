#download file and read into a dataframe
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Proj1Data.zip")
input <- unz("Proj1Data.zip","household_power_consumption.txt")
df <- read.table(input,header=TRUE,na.strings="?",sep=";")

#parse date/time and subset to dates required
df$Date <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df=subset(df, Date >= "2007-02-01" & Date < "2007-02-03") 
#when using Date<=2007-02-02 I lost all data after 00:00 on 2007-02-02

#set output device, plot graph, and close output device
png(file="plot2.png")
plot(df$Date,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()