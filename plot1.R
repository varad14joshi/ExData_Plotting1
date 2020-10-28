#read the dataset
p1<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")


#Selecing values with the Date specified in the project requirement
finaldata1<-subset(p1,Date %in% c("1/2/2007","2/2/2007"))


#changing the class of the variable Global Active Power to numeric
finaldata1$Global_active_power<-as.numeric(finaldata1$Global_active_power)


#Plotting the histogram
hist(finaldata1$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")


#Saving into a png file

dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()