loadData<- function(zipfilename="exdata-data-household_power_consumption.zip", 
                    urlzip="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ){
  if(!file.exists(zipfilename)) {
    
    download.file(urlzip,destfile=zipfilename)
    file <- unzip(zipfilename)
  } else {
    file <- unzip(zipfilename)
  }
  #read Data as Table using separator ";"
  powerData <- read.table(file, header=T, sep=";")
  
  #Read Date  as.Date using format (dd/mm/yyyy)
  powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
  
  #subsetting dataframe only using data from the dates 2007-02-01 and 2007-02-02
  dframe <- powerData[(powerData$Date=="2007-02-01") | (powerData$Date=="2007-02-02"),]
  
  #loading Global active, reactive Power and Voltage as numeric value
  dframe$Global_active_power <- as.numeric(as.character(dframe$Global_active_power))
  dframe$Global_reactive_power <- as.numeric(as.character(dframe$Global_reactive_power))
  dframe$Voltage <- as.numeric(as.character(dframe$Voltage))
  
  #transform Data and Time Values as DateTime
  dframe <- transform(dframe, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  #loading sub metering values as numerci values
  dframe$Sub_metering_1 <- as.numeric(as.character(dframe$Sub_metering_1))
  dframe$Sub_metering_2 <- as.numeric(as.character(dframe$Sub_metering_2))
  dframe$Sub_metering_3 <- as.numeric(as.character(dframe$Sub_metering_3))
  
  return (dframe)
}


