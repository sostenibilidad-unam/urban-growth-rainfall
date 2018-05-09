###Weather Stations Analysis Script
##Load libraries
library(data.table)
library(chron)
library(zoo)

###Functions

##obtener los porcentajes y conteo the valores faltantes para cada estación meteorológica 
Missing <- function(x) {  #
  percentage <- colMeans(is.na(x))*100
  suma <- colSums(is.na(x))
  return (list(percentage=percentage, suma=suma))
}

##Perform linear interpolation for missing values

LinearInterpol<- function (x) {
  Precipitacion<-na.approx(x[,3],  na.rm = TRUE) 
  Temperatura<-na.approx(x[,4],  na.rm = TRUE) 
  Weather<-cbind(Precipitacion,Temperatura)
  return(Weather)
}

##Get hourly precipitation and temperature
HourlyData<-function(Data){
  HourSumPrec <- rollapply(Data[,1],6,(sum),by=6,by.column=TRUE,align='right')
  #length(HourSumPrec)##8760 correct
  HourTemAve <- rollapply(Data[,2],6,(mean),by=6,by.column=TRUE,align='right')
  #length(HourTemAve)##8760 correct
  WeatherHour<-cbind(HourSumPrec,HourTemAve)
  return(WeatherHour)
}


#"Marmoles"#"LaMalinche""ValleBravo""ElChico"
####Extraer de cada estación meteorológica
year <- "2012"
listaDeEstaciones <- c("Atlacomulco","Cerro_Catedral","Ecoguardas","Huamantla","Huejutla","ParqueItza","Huichapan","NevadoToluca","PresaMadin",
                     "Zimapan")

for (estacion in listaDeEstaciones){
  nombreDeLaEstacion <- basename(estacion)
  print(nombreDeLaEstacion)
  listaDeDataFrames <- list()
  listaDeDataFrames[[1]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Enero.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[2]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Febrero.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[3]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Marzo.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[4]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Abril.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[5]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Mayo.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[6]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Junio.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[7]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Julio.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[8]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Agosto.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[9]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Septiembre.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[10]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Octubre.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[11]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Noviembre.csv"))[c("fecha", "Precipitacion", "TempAire")]
  listaDeDataFrames[[12]] = read.csv(file.path("./WeatherCatalogue/WeatherStations",estacion,year,"Diciembre.csv"))[c("fecha", "Precipitacion", "TempAire")]
  todosLosMeses <-rbindlist(listaDeDataFrames)
  write.csv(todosLosMeses, file = paste0(nombreDeLaEstacion,"_",year,".csv"))
}


#Once the variables of interest have been extracted,load single files

Atlaco <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Atlacomulco_2013.csv", 
                     header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Cerro <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Cerro_Catedral_2013.csv", 
                     header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Eco <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Ecoguardas_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Chico <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/ElChico_2013.csv", 
                  header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Huama <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Huamantla_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Hueju <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Huejutla_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Itza <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/ParqueItza_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Huicha <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Huichapan_2013.csv", 
                   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

#Mali <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/LaMalinche_2013.csv", 
                   #header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

#Marm <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Marmoles_2013.csv", 
                   #header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

NT <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/NevadoToluca_2013.csv", 
                   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Presa <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/PresaMadin_2013.csv", 
                   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Valle <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/ValleBravo_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Zima <- read.table("C:/Users/Usuario/Documents/WeatherCatalogue/Clean/2013/Zimapan_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)


stations <- list (Atlaco,Cerro,Eco,Huama,Hueju,Itza,Huicha,NT,Presa,Zima,Chico,Valle)
#######################################
##Perform diagnostic analysis
Diagnostics <- list()
Diagnostics <- lapply(stations, Missing)
#Diagnostics <- Missing(Huama)
#################################################
###Replace missing values using a linear interpolation applied to all dataframes
#xy<-LinearInterpol(Mali)

Interpol <- list()
#stations <- list (Atlaco,Cerro,Eco,Chico,Huama,Hueju,Itza,Huicha,NT,Presa,Zima)
Interpol <- lapply(stations, LinearInterpol)
###############################################################################

HourlyValues <- lapply(Interpol,HourlyData)

A <- as.data.frame(HourlyValues[[1]])
C <- as.data.frame(HourlyValues[[2]])
E <- as.data.frame(HourlyValues[[3]])
Ch <- as.data.frame(HourlyValues[[4]])
Hua <- as.data.frame(HourlyValues[[5]])
Hue <- as.data.frame(HourlyValues[[6]])
I <- as.data.frame(HourlyValues[[7]])
Hui <- as.data.frame(HourlyValues[[8]])
NT <- as.data.frame(HourlyValues[[9]])
P <- as.data.frame(HourlyValues[[10]])
Z <- as.data.frame(HourlyValues[[11]])


start <- as.POSIXct("2013-01-01")
interval <- 60
end <- start + as.difftime(365, units="days")
x<-seq(from=start, by=interval*60, to=end)
FechaHora<- as.factor(x[1:8760])

A$Fecha <- FechaHora
C$Fecha <- FechaHora
E$Fecha <- FechaHora
Ch$Fecha <- FechaHora
Hua$Fecha <- FechaHora
Hue$Fecha <- FechaHora
I$Fecha <- FechaHora
Hui$Fecha <- FechaHora
NT$Fecha <- FechaHora
P$Fecha <- FechaHora
Z$Fecha <- FechaHora



####################################################
##Plot meteorological data for each meteorological station
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


a <- plot(HourTemAve~Fecha, data=A, xlab="Time",ylab="Mean hourly temperature (°C)", main="Atlacomulco")
b <- plot(HourSumPrec~Fecha, data=A, xlab="Time",ylab="Sum hourly precipitation (mm)",main="Atlacomulco")

c <- plot(HourTemAve~Fecha, data=C, xlab="Time",ylab="Mean hourly temperature (°C)", main="Cerro_Catedral")
d <- plot(HourSumPrec~Fecha, data=C, xlab="Time",ylab="Sum hourly precipitation (mm)",main="Cerro_Catedral")

e <- plot(HourTemAve~Fecha, data=E, xlab="Time",ylab="Mean hourly temperature (°C)", main="Ecoguardas")
f <- plot(HourSumPrec~Fecha, data=E, xlab="Time",ylab="Sum hourly precipitation (mm)",main="Ecoguardas")


multi1<-multiplot(a,c,e, cols=2)






