# création d'un sous-répertoire pour les fichiers de données :
if(!file.exists("data")) {
     dir.create("data")
}

## fichier CSV :
# téléchargement du fichier :
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing_Idaho.csv", method = "curl")
list.files("./data")

# date du téléchargement :
dateDownload <- date()
dateDownload

# intégration des données dans un dataframe data :
data <- read.csv("./data/housing_Idaho.csv")


## fichier Excel :
# téléchargement du fichier :
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/GasAcquisProgram.xlsx", method = "curl")
dateDownload <- date()

dat <- read.xlsx("./data/GasAcquisProgram.xlsx", colIndex = c(7:15), rowIndex = c(18:23), header = TRUE)

# read.xlsx ne fonctionne pas => toutes les installs de packages liés à Excel sont KO à cause de Java
# => passage par un fichier txt :
dat <- read.table("./data/GasAcquisProgram.txt", sep = "\t", header = TRUE) #♣ séparateur tabulation


## fichier XML :
# téléchargement du fichier :
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL, useInternal = TRUE) # renvoie une erreur car ne semble pas gérer le httpS
# => tentative de chargement du fichier en local :
fileURL <- "./data/getdata_data_restaurants.XML"
doc <- xmlTreeParse(fileURL, useInternal = TRUE)
# cette fois, c'est bon !
rootNode <- xmlRoot(doc)
xmlName(rootNode) # => response
names(rootNode) # => row
zipcodes <- xpathSApply(rootNode,"//zipcode", xmlValue) # stocke l'ensemble des zipcodes dans une variable
sum(zipcodes == "21231") # donne le nb de zipcodes égaux à 21231

## nouveau fichier CSV :
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/housing_Idaho2.csv", method = "curl")
dateDownload <- date()
data <- read.csv("./data/housing_Idaho2.csv")