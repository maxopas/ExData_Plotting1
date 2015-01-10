read_data <- function() {
  library(data.table)
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dataDir <- "./data"
  zipFile <- paste(dataDir, "exdata-data-household_power_consumption.zip", sep="/")
  dataFile <- paste(dataDir, "household_power_consumption.txt", sep="/")
  
  if (!file.exists(dataDir)) {
    dir.create(dataDir)
  }
  if (!file.exists(zipFile)) {
    download.file(url=fileUrl, destfile=zipFile, method="curl", quiet=TRUE)
  }
  if (!file.exists(dataFile)) {
    unzip(zipFile, exdir=dataDir)
  }
  
  # First version, slow, but works everywhere.
  # data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")
  # Fast version, requires data.table and grep available (probably won't work on Windows)
  data <- fread(paste("egrep '^Date|^1/2/2007|^2/2/2007'", dataFile, sep=" "),
                data.table=FALSE, na.strings="?")
  data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  # Filtering is necessary if read.table is used.
  # subset(data, Datetime >= "2007-02-01" & Datetime < "2007-02-03")
  data
}
