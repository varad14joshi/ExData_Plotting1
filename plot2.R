#read the dataset
p2<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")


#Selecing values with the Date specified in the project requirement
finaldata2<-subset(p2,Date %in% c("1/2/2007","2/2/2007"))


#changing the class of the variable Global Active Power to numeric
finaldata2$Global_active_power<-as.numeric(finaldata2$Global_active_power)

#converting the date variable into date class and into a specific format
finaldata2$Date<-as.Date(finaldata2$Date,format("%d/%m/%Y"))


#Adding date and time variables
finaldata2$DateTime<-as.POSIXct(paste(finaldata2$Date,finaldata2$Time))

#Plotting the Date time against Global Active power
plot(finaldata2$DateTime,finaldata2$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = "l")

#Saving into a png file

dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()