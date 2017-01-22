library(data.table)

#Load the file
file <- fread("household_power_consumption.txt", header=TRUE, sep=";")

#Sub set the required period
subsetPeriod <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the X variable to be plotted, and make it Date-time
temp<-paste(subsetPeriod$Date, subsetPeriod$Time)
X<-strptime(temp, "%d/%m/%Y %H:%M:%S")

#Extract the Y1 variable to be plotted, and make it numerical
Y1<-as.numeric(subsetPeriod$Global_active_power)

#Extract the Y2 variable to be plotted, and make it numerical
Y2 <- as.numeric(subsetPeriod$Voltage)

#Extract the Y3 variables to be plotted, and make them numerical
Y3_1<-as.numeric(subsetPeriod$Sub_metering_1)
Y3_2<-as.numeric(subsetPeriod$Sub_metering_2)
Y3_3<-as.numeric(subsetPeriod$Sub_metering_3)

#Extract the Y4 variable to be plotted, and make it numerical
Y4 <- as.numeric(subsetPeriod$Global_reactive_power)

#Plot the extracted variables as PNG
png("plot4.png", width=480, height=480, bg = "transparent")
par(mfrow = c(2, 2)) 

#Plot1 - top left
plot(X, Y1, xlab = "", ylab = "Global Active Power", type="l")

#Plot2 - top right
plot(X, Y2, xlab = "datetime", ylab = "Voltage", type="l")

#Plot3 - bottom left
plot(X, Y3_1, xlab="", ylab="Energy sub metering", type="l")
lines(X, Y3_2, col="red", type="l")
lines(X, Y3_3, col="blue", type="l")
legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty="n")

#Plot4 - bottom right
plot(X, Y4, xlab = "datetime", ylab = "Global_reactive_power", type="l")

dev.off()


