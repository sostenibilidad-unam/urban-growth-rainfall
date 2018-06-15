columnas <- c ("HourSumPrec", "Mes", "Dia", "Hora", "Estaciones")
lluvia <- Tabla[columnas]

agregacion <- function(x){
  tmp <- aggregate (x[,1] ~ x[,2]+x[,5], FUN = sum)
}

res <- agregacion(lluvia)
colnames(res) <- c("Mes", "Estacion", "Precipitacion")

promedio <- function(x){
  tmp <- aggregate(x[,3] ~ x[,1], FUN = mean)
}

res2 <- promedio(res)
colnames(res2) <- c("Mes", "Promedio")


ggplot(res2, aes(x=Mes, y=Promedio)) +
  geom_point(shape=1)

ggplot(res2, aes(x=Mes, y=Promedio, color=Promedio)) + geom_point(shape=1)

colnames(res2) <- c("Mes", "Promedio")

ggplot(res2, aes(x="Mes", y="Promedio")) +
  geom_point(shape=1)


lluvia_ene <- lluvia[which (lluvia$Mes == "01"),]
lluvia_feb <- lluvia[which (lluvia$Mes == "02"),]
lluvia_mar <- lluvia[which (lluvia$Mes == "03"),]
lluvia_abr <- lluvia[which (lluvia$Mes == "04"),]
lluvia_may <- lluvia[which (lluvia$Mes == "05"),]
lluvia_jun <- lluvia[which (lluvia$Mes == "06"),]
lluvia_jul <- lluvia[which (lluvia$Mes == "07"),]
lluvia_ago <- lluvia[which (lluvia$Mes == "08"),]
lluvia_sep <- lluvia[which (lluvia$Mes == "09"),]
lluvia_oct <- lluvia[which (lluvia$Mes == "10"),]
lluvia_nov <- lluvia[which (lluvia$Mes == "11"),]
lluvia_dic <- lluvia[which (lluvia$Mes == "12"),]

ene_sum_lluvia <- sum(lluvia_ene$HourSumPrec)
feb_sum_lluvia <- sum(lluvia_feb$HourSumPrec)
mar_sum_lluvia <- sum(lluvia_mar$HourSumPrec)
abr_sum_lluvia <- sum(lluvia_abr$HourSumPrec)
may_sum_lluvia <- sum(lluvia_may$HourSumPrec)
jun_sum_lluvia <- sum(lluvia_jun$HourSumPrec)
jul_sum_lluvia <- sum(lluvia_jul$HourSumPrec)
ago_sum_lluvia <- sum(lluvia_ago$HourSumPrec)
sep_sum_lluvia <- sum(lluvia_sep$HourSumPrec)
oct_sum_lluvia <- sum(lluvia_oct$HourSumPrec)
nov_sum_lluvia <- sum(lluvia_nov$HourSumPrec)
dic_sum_lluvia <- sum(lluvia_dic$HourSumPrec)

suma_lluvias <- c(ene_sum_lluvia, feb_sum_lluvia, mar_sum_lluvia, abr_sum_lluvia, may_sum_lluvia, jun_sum_lluvia, jul_sum_lluvia, ago_sum_lluvia, sep_sum_lluvia, oct_sum_lluvia, nov_sum_lluvia, dic_sum_lluvia)

ggplot(suma_lluvias, aes(x="Mes", y="Suma")) +
  geom_point(shape=1)


plot(suma_lluvias) 



sort_lluvia <- lluvia[order(lluvia$HourSumPrec),]




#sumar los mm de lluvia para cada mes
#sacar la media de mm de lluvia para cada mes