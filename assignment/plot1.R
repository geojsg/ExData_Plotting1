## Loading the file
## working director set a the parent folder of "assignment"

classdf<-c(rep("character",2),rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";", header=T, colClasses=classdf,na.strings="?")

## Formating of the file

df$Date<-as.Date(strptime(df$Date, "%d/%m/%Y"))      

## Subset based on date between 1st and 2nd February 2007
dffeb<-subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plotting 
axname<-"Global Active Power (kilowatts)"
png(file="assignment/plot1.png", width = 480, height = 480)

with(dffeb, hist(Global_active_power, col="red",xlab=axname, main="Global Active Power"))

dev.off()
