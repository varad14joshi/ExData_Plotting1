#read the dataset
p4<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")


# Selecting values with the Date specified in the project requirement
finaldata4<-subset(p4,Date %in% c("1/2/2007","2/2/2007"))

#changing the class of the variable Global Active Power to numeric
finaldata4$Global_active_power<-as.numeric(finaldata4$Global_active_power)


#converting the date variable into date class and into a specific format
finaldata4$Date<-as.Date(finaldata4$Date,format("%d/%m/%Y"))


#Adding date and time variables
finaldata4$DateTime<-as.POSIXct(paste(finaldata4$Date,finaldata3$Time))



#splitting the plot in 2 rows and 2 columns and specifying the inner and outer margins
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


## Plot 1st Row and 1st Column
#Plotting the Date time against Global Active power
plot(finaldata4$DateTime,finaldata4$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = "l")

## Plot 1st Row and 2nd Column
#Plotting Date time against Voltage
plot(finaldata4$DateTime,finaldata4$Voltage,type="l",ylab = "Voltage",xlab = "dateTime")

##Plot 2nd Row and 1st Column
#Plotting the Date time against Sub Metering 1
plot(finaldata4$DateTime,finaldata4$Sub_metering_1,xlab="",ylab = "Energy Sub Metering",type = "l",col = "black")

#Plotting the Date time against Sub Metering 2
points(finaldata4$DateTime,finaldata4$Sub_metering_2,type = "l",col = "red")

#Plotting the Date time against Sub Metering 3
points(finaldata4$DateTime,finaldata4$Sub_metering_3,type = "l",col = "blue")


#Adding legend to the above plot

legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,bty = "n")
#Saving into a png file


##Plot 2nd row and 2nd Column
plot(finaldata4$DateTime,finaldata4$Global_reactive_power,ylab = "Global_reactive_power",xlab = "datime",type = "l")


dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()