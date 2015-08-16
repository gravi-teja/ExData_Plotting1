plot2<-function(){
  data<-read.csv2("household_power_consumption.txt", na.strings="?");
  data$Date<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
  data<-data[data$Date<strptime("2007-02-03", "%F"),];
  data<-data[data$Date>=strptime("2007-02-01", "%F"),];
  png(filename="plot2.png")
  plot(data$Date, data$Global_active_power, type="l",xlab="", ylab="Global Active Power(kilowatts");
  dev.off();
}