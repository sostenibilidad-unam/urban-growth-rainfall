Atlaco <- read.table("Atlacomulco_2013.csv", 
                     header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Atlacointerpol <-  LinearInterpol(Atlaco)
Atlacohourly<-  HourlyData(Atlacointerpol)
Cerro <- read.table("Cerro_Catedral_2013.csv",
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

Cerro <- read.table("Cerro_Catedral_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white = TRUE)
Cerrointerpol <- LinearInterpol(Cerro)
Cerrohourly <- HourlyData(Cerrointerpol)

Ecoguardas <- read.table("Ecoguardas_2013.csv",
                         header = TRUE, sep = ",", na.strings="NA", dec = ".", strip.white = TRUE)
Ecoguardasinterpol <- LinearInterpol(Ecoguardas)
Ecoguardashourly <- HourlyData(Ecoguardasinterpol)

Chico <- read.table("ElChico_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Chicointerpol <- LinearInterpol(Chico)
Chicohourly <- HourlyData(Chicointerpol)

Huama <- read.table("Huamantla_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Huamainterpol <- LinearInterpol(Huama)
Huamahourly <- HourlyData(Huamainterpol)

Hueju <- read.table("Huejutla_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Huejuinterpol <- LinearInterpol(Hueju)
Huejuhourly <- HourlyData(Huejuinterpol)

Huicha <- read.table("Huichapan_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Huichainterpol <- LinearInterpol(Huicha)
Huichahourly <- HourlyData(Huichainterpol)

Izta <- read.table("ParqueItza_2013.csv", 
                   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Iztainterpol <- LinearInterpol(Izta)
Iztahourly <- HourlyData(Iztainterpol)

Nevado <- read.table("NevadoToluca_2013.csv", 
                     header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Nevadointerpol <- LinearInterpol(Nevado)
Nevadohourly <- HourlyData(Nevadointerpol)

Presa <- read.table("PresaMadin_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Presainterpol <- LinearInterpol(Presa)
Presahourly <- HourlyData(Presainterpol)

Valle <- read.table("ValleBravo_2013.csv", 
                    header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Valleinterpol <- LinearInterpol(Valle)
Vallehourly <- HourlyData(Valleinterpol)

Zima <- read.table("Zimapan_2013.csv", 
                   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
Zimainterpol <- LinearInterpol(Zima)
Zimahourly <- HourlyData(Zimainterpol)

merge(Atlacohourly, Cerrohourly, by = c("HourSumPrec", "HourTemAve"))
