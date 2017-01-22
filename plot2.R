library(data.table)

#Load the file
file <- fread("household_power_consumption.txt", header=TRUE, sep=";")

#Sub set the required period
subsetPeriod <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract the X variable to be plotted, and make it Date-time
temp<-paste(subsetPeriod$Date, subsetPeriod$Time)
X<-strptime(temp, "%d/%m/%Y %H:%M:%S")

#Extract the Y variable to be plotted, and make it numerical
Y<-as.numeric(subsetPeriod$Global_active_power)

#Plot the extracted variables as PNG
png("plot2.png", width=480, height=480, bg = "transparent")
plot(X, Y, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()