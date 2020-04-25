library(dplyr)
####Data####
setwd("~/Cursos/Analysis_Exploratory_Data/Datos")
datos <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

datos$Date <- as.Date(datos$Date, "%d/%m/%Y")

datos<- filter(datos,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dateTime <- paste(datos$Date, datos$Time) 
datos<-select(datos,-(Date:Time))
datos<-cbind(dateTime,datos)
datos$dateTime <- as.POSIXct(dateTime)
