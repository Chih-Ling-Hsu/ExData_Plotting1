dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- subset(dataset, Date=="1/2/2007" | Date=="2/2/2007")

data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

yrange <- with(data, c(min(Sub_metering_1, Sub_metering_2, Sub_metering_3), max(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
leg <- legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
leftx <- leg$rect$left - leg$rect$w*0.1
rightx <- (leg$rect$left + leg$rect$w) * 1
topy <- leg$rect$top
bottomy <- (leg$rect$top - leg$rect$h) * 1

with(data, plot(Datetime, Sub_metering_1, ylim=yrange, xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(Datetime, Sub_metering_1))
with(data, lines(Datetime, Sub_metering_2, col="red"))
with(data, lines(Datetime, Sub_metering_3, col="blue"))
with(data, legend(x=c(leftx, rightx), y=c(topy, bottomy), lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
