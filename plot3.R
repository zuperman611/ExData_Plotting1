library(data.table)

#Load the file
file <- fread("household_power_consumption.txt", header=TRUE, sep=";")

#Sub set the required period
subsetPeriod <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the X variable to be plotted, and make it Date-time
temp<-paste(subsetPeriod$Date, subsetPeriod$Time)
X<-strptime(temp, "%d/%m/%Y %H:%M:%S")

#Extract the Y variables to be plotted, and make them numerical
Y1<-as.numeric(subsetPeriod$Sub_metering_1)
Y2<-as.numeric(subsetPeriod$Sub_metering_2)
Y3<-as.numeric(subsetPeriod$Sub_metering_3)

#Plot the extracted variables as PNG
png("plot3.png", width=480, height=480, bg = "transparent")
plot(X, Y1, xlab="", ylab="Energy sub metering", type="l")
lines(X, Y2, col="red", type="l")
lines(X, Y3, col="blue", type="l")
legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()