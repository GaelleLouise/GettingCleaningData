## Question 1
# téléchargement du fichier :
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing_Idaho.csv", method = "curl")
# date du téléchargement :
dateDownload <- date()
# intégration des données dans un dataframe data :
data <- read.csv("./data/housing_Idaho.csv")

#split des noms de colonnes sur "wgtp" :
strsplit(names(data),"wgtp")
# affichage des parties numériques seulement des colonnes concernées :
sapply(strsplit(names(data),"wgtp")[109:188], function(x) {x[2]})


## Question 2
# téléchargement du fichier :
if(!file.exists("./data")) {dir.create("./data")}
#file Gross Domestic Product data:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/Gross_Domestic_Product.csv", method = "curl")
# date du téléchargement :
dateDownload <- date()
# intégration des données dans un dataframe data :
gross <- read.csv("./data/Gross_Domestic_Product.csv", skip = 5, header = FALSE,
                  col.names = c("CountryCode","Rank","Vide1","CountryName","GrossDomesticProduct"
                                ,"Vide2","Vide3","Vide4","Vide5","Vide6"), nrows = 190)
# suppression des virgules du champ GDP puis conversion en numérique pour pouvoir faire la moyenne :
mean(as.numeric(gsub(",","",gross$GrossDomesticProduct)), na.rm = TRUE)


## Question 3
grep("^United", gross$CountryName)
# => donne un vecteur de 3 éléments => 3 pays ont le nom qu icommence par "United"


## Questin 4
# file Educational data:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile = "./data/Education.csv", method = "curl")
# date du téléchargement :
dateDownload <- date()
# intégration des données dans un dataframe data :
educ <- read.csv("./data/Education.csv")
GrossEduc = merge(gross, educ, all = FALSE)

# l'année fiscale est cachée dans le champ "Special.Notes"
grep("iscal year end: June 30", GrossEduc$Special.Notes, value = TRUE)


## Question 5
# code fourni pour récupérer les données sur les prix desdonnées du NASDAQ et NYSE :
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

# charger le package lubridate :
library(lubridate)
sum(year(ymd(sampleTimes)) == 2012) # => 250
sum(year(ymd(sampleTimes)) == 2012 & weekdays(ymd(sampleTimes)) == "Monday") # => 47
