## Loading the file

classdf<-c(rep("character",2),rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";", header=T, colClasses=classdf,na.strings="?")

## Formating of the file

df$Datetime<-strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")

df$Date<-as.Date(strptime(df$Date, "%d/%m/%Y"))      

## Subset based on date between 1st and 2nd February 2007
dffeb<-subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plotting 
axname<-"Global Active Power"
png(file="assignment/plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
## Plot 1
with(dffeb, plot(Datetime,Global_active_power,ylab=axname,xlab="",type="l"))

## Plot 2
vars<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colors<-c("black","red", "blue")
with(dffeb, plot(x=Datetime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",col=colors[1]))
with(dffeb, lines(Datetime,Sub_metering_2, col=colors[2]))
with(dffeb, lines(Datetime,Sub_metering_3, col=colors[3]))
legend("topright",legend=vars, lty=1, col=colors)

## Plot 3
with(dffeb, plot(Datetime,Voltage,type="l"))

## Plot 4
with(dffeb, plot(Datetime,Global_reactive_power,type="l"))

dev.off()
  
