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
## library(PCICt)
## library(dplyr)
## library(tidyr)
## library(ggplot2)

args <- commandArgs(TRUE)

estaciones <- read.csv(args[1])
climate_output <- nc_open(args[2])

lon <- ncvar_get(climate_output, varid = "XLONG")
lat <- ncvar_get(climate_output, varid = "XLAT")
temp <- ncvar_get(climate_output, varid = "T2")
pp0 <- ncvar_get(climate_output, varid = "RAINC")
pp1 <- ncvar_get(climate_output, varid = "RAINNC")

for (x in 1:length(estaciones[,1])){
  column <- match(round(estaciones[x ,1], digits=2), round(lat[1,], digits=2))
  row <- match(round(estaciones[x, 2], digits=2), round(lon[,1], digits=2))
  print(c(temp[row, column], pp0[row, column], pp1[row, column]))
}
