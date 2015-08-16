plot4<-function(){
  data<-read.csv2("household_power_consumption.txt", na.strings="?");
  data$Date<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
  data<-data[data$Date<strptime("2007-02-03", "%F"),];
  data<-data[data$Date>=strptime("2007-02-01", "%F"),];
  png(filename="plot4.png");
  par(mfrow = c(2, 2));
  plot(data$Date, data$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts)");
  plot(data$Date, data$Voltage, type="l",xlab="", ylab="Voltage");
  plot(data$Date, data$Sub_metering_1, type="l",xlab="", ylab="Energy submetering", col="black");
  lines(data$Date, data$Sub_metering_2, type="l",xlab="", ylab="Energy submetering", col="red");
  lines(data$Date, data$Sub_metering_3, type="l",xlab="", ylab="Energy submetering", col="blue");
  legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  plot(data$Date, data$Global_reactive_power, type="l",xlab="", ylab="Global Reactive Power");
  dev.off();
}