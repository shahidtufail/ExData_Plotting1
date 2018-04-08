
getwd()

if (!file.exists("C:/Users/Shahid/Documents/PowerConsumption.csv")) {
  # Read the data to a data frame
  new_data <- read.table("C:/Users/Shahid/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  attach(new_data)
  new_data <- new_data[(Date == "1/2/2007" | Date == "2/2/2007"), ]
  attach(new_data)
  new_data$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  rownames(new_data) <- 1 : nrow(new_data)
  attach(new_data)
  new_data <- cbind(new_data[, 10], new_data[, 3:9])
  colname <- colnames(new_data)
  colname[1] <- "Date_time"
  colnames(new_data) <- colname
  attach(new_data)
  write.csv(new_data, file = "C:/Users/Shahid/Documents/PowerConsumption.csv", row.names = FALSE)
} else {
  # Read the data to a data frame
  new_data <- read.csv(file = "C:/Users/Shahid/Documents/PowerConsumption.csv", header = TRUE)
  attach(new_data)
}