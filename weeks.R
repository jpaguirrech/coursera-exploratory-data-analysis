## Week 1 

library(datasets)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
airquality<- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

## pch: the plotting system (default in open circle)
## lty: the line type
## lwd: line width
## col: plotting color, could be a name, or number or hex code
## xlab ylab: for labels name
## las: the orientation of the axis labels
## bg: background color
## mar: margin size
## oma: outher margin
## mfrow: number of plots pero row
## ro see defaults of each of these variables use: 
par("bg")
par("pch")
par("mar")

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in NYC")

## adding title in the plot
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC"))
## Adding color to month 
with(subset(airquality, Month ==5), points(Wind, Ozone, col="green"))
with(subset(airquality, Month==6), points(Wind,Ozone, col="red"))

## adding label and colors to points
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", type = "n"))
with(subset(airquality, Month ==5), points(Wind, Ozone, col="green"))
with(subset(airquality, Month!=5), points(Wind,Ozone, col="red"))
legend("top", pch = 1, col= c("green", "red"), legend = c("May", "Other Months"))
     
## Adding regression line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", pch = 20))
model<-lm(Ozone~Wind, airquality)
abline(model, lwd=1)

## creating 2 plots simultaneasly
par(mfrow=c(1,2))
with(airquality,{
  plot(Wind, Ozone, main =" Ozone & Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

## Multiple base plots
par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality,{
  plot(Wind, Ozone, main =" Ozone & Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone & Temperature")
  mtext("Ozone and Weather in NYC", outer = TRUE)
})