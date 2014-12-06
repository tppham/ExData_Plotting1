plot1 <- function(filename="./household_power_consumption.txt", startDate="1/2/2007", duration=2) {
    ## Plot the histogram of Global Active Power
    
    
    ## Read the first two rows of the dataset to obtain the column name
    tab2rows <- fread(filename, sep=";", header=TRUE, na.strings="?",stringsAsFactor=FALSE, nrows="2")
    
    ## Extra required data based on the .txt file
    ##Note: skip = startDate  << fread() will search for the "startDate" in the file and start reading on the line that contain "startDate" 
    ## nrows: Data had one-minute sampling rate therefore in 1 day will have 1day x 24hours/day x 60minutes/hour = 1440 datapoints.
    ## this explain why norows input parameters will be determin by duration*1440
    DT <- fread(filename, sep=";", header=FALSE, na.strings="?",stringsAsFactor=FALSE, skip="1/2/2007", nrows="2880")
    
    ## Set the column names to the DT object
    setnames(DT,colnames(DT),colnames(tab2rows))
    
    ## Start the plot1 with required Title, Axis Title
    with(DT, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))
}