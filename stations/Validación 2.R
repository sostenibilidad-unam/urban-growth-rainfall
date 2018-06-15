#MEDIAS
##Temperatura
#Sacamos medias de cada mes para cada estación. 

newdata <- Tabla_final[ which(Tabla_final$Estaciones =='Atlacomulco' & Tabla_final$Meses == 'May'), ]
WRF_average_temp1 <- mean(newdata[,12])

newdata2 <-  Tabla_final[ which(Tabla_final$Estaciones =='Cerro' & Tabla_final$Meses == 'May'), ]
WRF_average_temp2 <- mean(newdata2[,12])

newdata3 <-  Tabla_final[ which(Tabla_final$Estaciones =='Chico' & Tabla_final$Meses == 'May'), ]
WRF_average_temp3 <- mean(newdata3[,12])

newdata4 <- Tabla_final[ which(Tabla_final$Estaciones =='Ecoguardas' & Tabla_final$Meses == 'May'), ]
WRF_average_temp4 <- mean(newdata4[,12])

newdata5 <- Tabla_final[ which(Tabla_final$Estaciones =='Izta' & Tabla_final$Meses == 'May'), ]
WRF_average_temp5 <- mean(newdata5[,12])

newdata6 <- Tabla_final[ which(Tabla_final$Estaciones =='Izta' & Tabla_final$Meses == 'May'), ]
WRF_average_temp5 <- mean(newdata5[,12])



##cool

OBS_average_temp <- aggregate(Tabla_final[,2] ~ Tabla_final[,3], FUN = mean)

#Precipitación
WRF_average_prec <- aggregate(Tabla_final[,13] ~ Tabla_final[,3], FUN = mean)

OBS_average_prec <- aggregate(Tabla_final[,1] ~ Tabla_final[,3], FUN = mean)