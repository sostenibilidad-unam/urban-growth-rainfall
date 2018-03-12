# install.packages("ncdf4")
# install.packages("ncdf4.helpers")
# install.packages("PCICt")
# install.packages("tidyr")
# install.packages("ggplot2")
# install.packages("readdr")
# install.packages("ggplot2")
# install.packages("ggplot2")

library(ncdf4)
library(ncdf4.helpers)
library(PCICt)
# library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

estaciones <- read.csv("Estaciones_WRF.csv")
estaciones <- estaciones 
climate_output <- nc_open("wrfout_d04_2013-01-01_00%3A00%3A00")

lon <- ncvar_get(climate_output, varid = "XLONG")
lat <- ncvar_get(climate_output, varid = "XLAT")
temp <- ncvar_get(climate_output, varid = "T2")
pp0 <- ncvar_get(climate_output2, varid = "RAINC")
pp1 <- ncvar_get(climate_output2, varid = "RAINNC")


TablaWRF <- c()

for (x in 1:length(estaciones[,1])){
  column <- match(round(estaciones[x,1],digits=2),round(lat[1,],digits = 2))
  row <- match(round(estaciones[x,2],digits=2),round(lon[,1],digits = 2))
  TablaWRF <- append(TablaWRF,temp[row,column])
  TablaWRF <- append(TablaWRF,pp0[row,column])
  TablaWRF <- append(TablaWRF,pp1[row,column])
  print(c(x, column,temp[row,column]))
}
