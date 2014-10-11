#download file and read into a dataframe
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Proj1Data.zip")
input <- unz("Proj1Data.zip","household_power_consumption.txt")
df <- read.table(input,header=TRUE,na.strings="?",sep=";")

#parse date and subset to dates required
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df=subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

#set output device, plot histogram, and close output device
png(file="plot1.png")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()