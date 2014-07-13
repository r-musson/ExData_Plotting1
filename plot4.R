
# set up options
file <- "household_power_consumption.txt"
cols <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
nas <- "?"
# get raw data
raw.data <- read.table(file, header = TRUE, sep = ";", quote = "\"",dec = ".", 
                   fill = TRUE, comment.char = "",na.strings=nas,colClasses=cols)

# look only at dates of interest
data <- raw.data[raw.data[,1] == "1/2/2007" | raw.data[,1] == "2/2/2007",]

#add a column for dateTime
data$DateTime <- strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")

rm(raw.data)  # save some RAM

#plot 4

# open the file
png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

days <- data$DateTime
gap <- data$Global_active_power
volts <- data$Voltage
sub1 <- data$Sub_metering_1
sub2 <- data$Sub_metering_2
sub3 <- data$Sub_metering_3
grp <- data$Global_reactive_power
  
  
#plot the line chart 1,1
plot(days,gap,type="l",ylab="Global Active Power",xlab="")

#plot volts at 2,1
plot(days,volts,type="l",ylab="Voltage",xlab="datetime")


#plot the line chart at 2,1
plot(days,sub1,col="black",type="l",ylab="Energy sub metering",xlab="")
lines(days,sub2,col="red")
lines(days,sub3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

# plot global_reactive power at 2,2
plot(days,grp,type="l",ylab="Global_reactive_power",xlab="datetime")

#close the file
dev.off()
