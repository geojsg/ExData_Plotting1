## Loading the file

classdf<-c(rep("character",2),rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";", header=T, colClasses=classdf,na.strings="?")

## Formating of the file

df$Datetime<-strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")

df$Date<-as.Date(strptime(df$Date, "%d/%m/%Y"))      

## Subset based on date between 1st and 2nd February 2007
dffeb<-subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plotting 
axname<-"Global Active Power (kilowatts)"
png(file="assignment/plot2.png", width = 480, height = 480)

with(dffeb, plot(Datetime,Global_active_power,ylab=axname,xlab="",type="l"))

dev.off()
