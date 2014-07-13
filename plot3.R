
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

#plot 3

# open the file
png(filename="plot3.png",width = 480, height = 480)
#plot the line chart
sub1 <- data$Sub_metering_1
sub2 <- data$Sub_metering_2
sub3 <- data$Sub_metering_3
days <- data$DateTime
plot(days,sub1,col="black",type="l",ylab="Energy sub metering",xlab="")
lines(days,sub2,col="red")
lines(days,sub3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
#close the file
dev.off()
