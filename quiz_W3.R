## Question 1
# téléchargement du fichier :
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing_Idaho.csv", method = "curl")
# date du téléchargement :
dateDownload <- date()
# intégration des données dans un dataframe data :
data <- read.csv("./data/housing_Idaho.csv")

# vérifie les conditions ACR = 3 et AGS = 6 pour créer un vecteur logique :
agricultureLogical <- data[,"ACR"] == 3 & data[,"AGS"] == 6
data[which(agricultureLogical),]


## Question 2
# téléchargement du fichier :
if(!file.exists("./data")) {dir.create("./data")}
filejpeg <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(filejpeg, destfile = "./data/photo.jpg", method = "curl")
dateDownload <- date()
# chargement du package jpeg :
library(jpeg)
# stockage de la photo et application du quantile voulu (0.3 -> 0.8)
photo <- readJPEG("./data/photo.jpg", native = TRUE)
quantile(photo, probs = c(0.3, 0.8))


## Question 3
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
# file Educational data:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile = "./data/Education.csv", method = "curl")
# date du téléchargement :
dateDownload <- date()
# intégration des données dans un dataframe data :
educ <- read.csv("./data/Education.csv")

# vérification des noms en commun :
intersect(names(gross), names(educ))
#seul le code pays en commun, donc on peut faire un Merge "automatique" (sinon, il faut préciser by.x et by.y)
GrossEduc = merge(gross, educ, all = FALSE)
GrossEduc <- GrossEduc[order(GrossEduc$Rank, decreasing = TRUE, na.last = TRUE),]
head(GrossEduc ,13)


## Question 4
# on regroupe les données par Income.Group (2 valeurs seulement) pour calculer le ranking moyen pour chaque groupe :
tapply(GrossEduc$Rank,GrossEduc$Income.Group, mean, na.rm = TRUE)

## Question 5 :
#Répartir les ranking en 5 quantiles pour connaître le nb de pays dans le premier ranking mais avec "lower middle income"
# ATTENTION : package Hmisc nécessaire pour fonction cut2
GrossEduc$RankGroups = cut2(GrossEduc$Rank, g = 5)
table(GrossEduc$Income.Group, GrossEduc$RankGroups)
