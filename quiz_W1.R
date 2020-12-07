# création d'un sous-répertoire pour les fichiers de données :
if(!file.exists("data")) {
     dir.create("data")
}

# téléchargement du fichier :
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing_Idaho.csv", method = "curl")
list.files("./data")

# date du téléchargement :
dateDownload <- date()
dateDownload

# intégration des données dans un dataframe data :
data <- read.csv("./data/housing_Idaho.csv")

