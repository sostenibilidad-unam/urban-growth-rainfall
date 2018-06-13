#MEDIAS
##Temperatura
#Sacamos medias de todos los meses para cada estación. 
WRF_average_temp <- aggregate(Tabla_final[,12] ~ Tabla_final[,3], FUN = mean)

OBS_average_temp <- aggregate(Tabla_final[,2] ~ Tabla_final[,3], FUN = mean)

#Precipitación
WRF_average_prec <- aggregate(Tabla_final[,13] ~ Tabla_final[,3], FUN = mean)

OBS_average_prec <- aggregate(Tabla_final[,1] ~ Tabla_final[,3], FUN = mean)


#CORRELACIÓN
##Temperatura
###Crear una función para los estadísticos. 
library(plyr)
correlacion <- function(x){
  tmp <- cor.test(x[,12], x[,2])
  pvalue <- tmp$p.value
  estadistico <- tmp$estimate
  valores <- data.frame(c(estadistico,pvalue))
  valores
}

correlaciones_temp <- ddply(Tabla_final, .(Tabla_final[,3]), correlacion)

##Precipitación
library(plyr)
correlacion <- function(x){
  tmp <- cor.test(x[,13], x[,1])
  pvalue <- tmp$p.value
  estadistico <- tmp$estimate
  valores <- data.frame(c(estadistico,pvalue))
  valores
}

correlaciones_prec <- ddply(Tabla_final, .(Tabla_final[,3]), correlacion)

#MEANS_DIFFERENCE
##Temperatura
mean_diff <- function(x){
  tmp1 <- t.test(x[,12], x[,2])
  estadistico <- tmp1$estimate
  pvalue <- tmp1$p.value
  valort <- tmp1$statistic
  #esperado menos observado
  diferencia <- tmp1$estimate[1]-tmp1$estimate[2]
  valores <- data.frame(c(diferencia,valort,pvalue))
}


mean_diff_temp <- ddply(Tabla_final, .(Tabla_final[,3]), mean_diff)
a <-t.test(Tabla_final$HourTemAve,Tabla_final$TC)

##Precipitación
mean_diff <- function(x){
  tmp1 <- t.test(x[,13], x[,1])
  estadistico <- tmp1$estimate
  pvalue <- tmp1$p.value
  valort <- tmp1$statistic
  #esperado menos observado
  diferencia <- tmp1$estimate[1]-tmp1$estimate[2]
  valores <- data.frame(c(diferencia,valort,pvalue))
}


mean_diff_prec <- ddply(Tabla_final, .(Tabla_final[,3]), mean_diff)
a <-t.test(Tabla_final$HourTemAve,Tabla_final$TC)


#RMSE
##Temperatura
RMSE <- function(x){
  error <- x[,12] - x[,2]
  tmp <- sqrt(mean(error^2))
  tmp
}

rmse_temp <- ddply(Tabla_final, .(Tabla_final[,3]), RMSE)

##Precipitación

RMSE <- function(x){
  error <- x[,13] - x[,1]
  tmp <- sqrt(mean(error^2))
  tmp
}

rmse_prec <- ddply(Tabla_final, .(Tabla_final[,3]), RMSE)


#DATA FRAME CON ESTADISTICOS
Validacion <- c (WRF_average_temp, OBS_average_temp, correlacion_temp[c(1,3,5,7,9,11,13),], mean_diff_temp [c(1,4,7,10,13,16,19),], rmse_temp, WRF_average_prec, OBS_average_prec, correlacion_prec[c(1,3,5,7,9,11,13)], mean_diff_prec[c(1,4,7,10,13,16,19),], rmse_prec)



correlacion_temp[c(1,3,5,7,9,11,13),]
