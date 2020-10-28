#read the dataset
p3<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")


#Selecing values with the Date specified in the project requirement
finaldata3<-subset(p3,Date %in% c("1/2/2007","2/2/2007"))



#converting the date variable into date class and into a specific format
finaldata3$Date<-as.Date(finaldata3$Date,format("%d/%m/%Y"))


#Adding date and time variables
finaldata3$DateTime<-as.POSIXct(paste(finaldata3$Date,finaldata3$Time))

#Plotting the Date time against Sub Metering 1
plot(finaldata3$DateTime,finaldata3$Sub_metering_1,xlab="",ylab = "Energy Sub Metering",type = "l",col = "black")

#Plotting the Date time against Sub Metering 2
points(finaldata3$DateTime,finaldata3$Sub_metering_2,type = "l",col = "red")

#Plotting the Date time against Sub Metering 3
points(finaldata3$DateTime,finaldata3$Sub_metering_3,type = "l",col = "blue")


#Adding legend to the plot

legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2)
#Saving into a png file


dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()