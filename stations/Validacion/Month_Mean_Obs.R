#PRECIPITACION 

#Hacemos un subset "lluvia" de la base de datos "Tabla"en el que se incluye sólo el periodo, las estaciones y la precipitación observada. 
columnas <- c ("HourSumPrec", "Mes", "Dia", "Hora", "Estaciones")
lluvia <- Tabla[columnas]

#Funcion_1
#Creamos una función "agregacion" para sumar los valores de precipitación en función del mes y la estación. 
agregacion <- function(x){
  tmp <- aggregate (x[,1] ~ x[,2]+x[,5], FUN = sum)
}

#Corremos la función "agregación" sobre nuestro objeto "lluvia".  
res <- agregacion(lluvia)
colnames(res) <- c("Mes", "Estacion", "Precipitacion")

#Creamos una segunda función "promedio" para obtener el promedio de la precipitación en función del mes
promedio <- function(x){
  tmp <- aggregate(x[,3] ~ x[,1], FUN = mean)
}

#Aplicamos la función_2 "promedio" al resultado de la función_1
res2 <- promedio(res)
colnames(res2) <- c("Mes", "Precipitacion")








#TEMPERATURA
#Hacemos un subset "temperatura" de la base de datos "Tabla"en el que se incluye sólo el periodo, las estaciones y la temperatura observada. 
columnas <- c ("HourTemAve", "Mes", "Dia", "Hora", "Estaciones")
temperatura <- Tabla[columnas]

#Funcion_1
#Creamos una función "agregacion" para promediar los valores de temperatura en función del mes y la estación.
##Esta función "agregación" es diferenet a la que usamos para la precipitación pues aquí en lugar de sumar, tenemos que promediar. 

agregacion <- function(x){
  tmp <- aggregate (x[,1] ~ x[,2]+x[,5], FUN = mean) #mean, no suma. 
}

#Aplicamos la función "agregación" a nuestro objeto "temperatura"
res_temp <- agregacion(temperatura)
colnames(res_temp) <- c("Mes", "Estacion", "Temperatura")


#Creamos una segunda función "promedio" para obtener el promedio de la temperatura en función del mes
promedio <- function(x){
  tmp <- aggregate(x[,3] ~ x[,1], FUN = mean)
}

#Aplicamos la función_2 "promedio" al resultado de la función_1
res_temp2 <- promedio(res_temp)
colnames(res_temp2) <- c("Mes", "y1")







#TABLA

#Creamos una tabla en donde estén los valores obtenidos para amabas variables.
Temp <- as.data.frame(res_temp2$y1)
colnames(Temp) <- c("temperatura")

Variables <- c(res2, Temp)
temp_prec <- as.data.frame(Variables)








#GRAFICAR

#Graficamos el resultado (promedio) de ambas variables
## set up the data
Mes <- seq(1:12)
Pp <- c(temp_prec$Precipitacion)
Tp <- c(temp_prec$temperatura)


## add extra space to right margin of plot within frame
par(mar=c(5, 4, 4, 6) + 0.1)

## Plot first set of data and draw its axis
plot(Mes, Pp, pch=16, axes=FALSE, ylim=c(0,300), xlab="", ylab="", 
     type="b",col="black", main="Observed Precipitation and Temperature in 2013")
axis(2, ylim=c(0,300),col="black",las=1)  ## las=1 makes horizontal labels
mtext("Monthly mean precipitation (mm)",side=2,line=2.5)
box()

## Allow a second plot on the same graph
par(new=TRUE)

## Plot the second plot and put axis scale on right
plot(Mes, Tp, pch=15,  xlab="", ylab="", ylim=c(0,14), 
     axes=FALSE, type="b", col="red")
## a little farther out (line=4) to make room for labels
mtext("Monthly mean temperature (Celsius)",side=4,col="red",line=4) 
axis(4, ylim=c(0,14), col="red",col.axis="red",las=1)

## Draw the time axis
axis(1,pretty(range(Mes),12))
mtext("Time (Months)",side=1,col="black",line=2.5)  

## Add Legend
legend("topright",
       legend=c("Precipitation","Temperature"),
       text.col=c("black","red"),pch=c(16,15),col=c("black","red"),
       cex = 0.75)


#fin
