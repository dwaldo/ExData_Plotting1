### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### plot4.R: Create PNG of 4 plots
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Read data from text-delimited file.
### We know the column classes.
### NA values are represented by a "?".
all_data <- read.delim(
  "household_power_consumption.txt", 
  sep = ";", 
  stringsAsFactors = FALSE,
  colClasses=c(rep("character",2),rep("numeric",7)),
  na.string = "?"

)

### Subset data for dates of interest
df <- subset(all_data, Date == "1/2/2007" | Date == "2/2/2007")

### Convert date and time strings/columns to new TimeStamp (POSIXlt) column
df$TimeStamp <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

### Create PNG of 4 plots
png("plot4.png", width=480, height=480)

### 4 plots - 2 rows, 2 columns
par(mfrow=c(2,2))

### Adjust left margin
par(mar = c(5.1, 5, 4.1, 2))

with( 
  df, {

    #### Plot1: Global Active Power plot
    plot(TimeStamp, Global_active_power, 
      type = "n",
      ylab = "Global Active Power",
      xlab = ""
    )
    lines(TimeStamp, Global_active_power)

    ### Plot2: Voltage plot
    plot(TimeStamp, Voltage, 
      type = "n",
      xlab = "datetime"
    )
    lines(TimeStamp, Voltage)

    ### Plot3: Energy sub metering plot
    plot(TimeStamp, Sub_metering_1, 
      type = "n",
      ylab = "Energy sub metering",
      xlab = ""
    )
    lines(TimeStamp, Sub_metering_1, col="black")
    lines(TimeStamp, Sub_metering_2, col="red")
    lines(TimeStamp, Sub_metering_3, col="blue")
    legend(
      "topright", 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty = 1,
      bty = "n",
      col = c("black", "red", "blue")
    )

    ### Plot4: Reactive Power plot
    plot(TimeStamp, Global_reactive_power, 
      type = "n",
      xlab = "datetime"
    )
    lines(TimeStamp, Global_reactive_power)
  }
)

dev.off()
