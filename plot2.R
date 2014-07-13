
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

#plot 2 - line graph of global active power

# open the file
png(filename="plot2.png",width = 480, height = 480)
#plot the line chart
gap <- data$Global_active_power
days <- data$DateTime
plot(days,gap,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#close the file
dev.off()
