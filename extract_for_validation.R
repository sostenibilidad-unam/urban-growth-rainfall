#!/usr/bin/env Rscript

## This script will read ncdf4 encoded WRF output files and extract
## variables T2, RAINC and RAINNC for pairs of Lat, Lon given in a csv
## file.
##
## Usage:
##
##     $ ./extract_for_validation.R weather_stations.csv wrfout_d04_2013-05-01_00\:00\:00 output.csv
##
## Where
## - "weather_stations.csv" contains pairs of Lat, Lon in rows
## - wrfout_d04_2013-05-01_00\:00\:00 is a ncdf4 encoded file output by WRF
## - output.csv is where triads of T2, RAINC, RAINNC will be saved, in
##   a single row, one for each pair of Lat, Lon given at input
##

library(ncdf4)
library(ncdf4.helpers)

args <- commandArgs(TRUE)

estaciones <- read.csv(args[1])
climate_output <- nc_open(args[2])

lon <- ncvar_get(climate_output, varid = "XLONG")
lat <- ncvar_get(climate_output, varid = "XLAT")
temp <- ncvar_get(climate_output, varid = "T2")
pp0 <- ncvar_get(climate_output, varid = "RAINC")
pp1 <- ncvar_get(climate_output, varid = "RAINNC")

date <- tail(strsplit(args[2], "_")[[1]], n=2)[1]
time <- tail(strsplit(args[2], "_")[[1]], n=2)[2]

out <- c(c(date, time))

for (x in 1:length(estaciones[,1])){
  column <- match(round(estaciones[x ,1], digits=2), round(lat[1,], digits=2))
  row <- match(round(estaciones[x, 2], digits=2), round(lon[,1], digits=2))
  out <- append(out, (c(temp[row, column], pp0[row, column], pp1[row, column])))
}

write.table(t(unlist(out)), file=args[3], row.names=FALSE, col.names=FALSE)
