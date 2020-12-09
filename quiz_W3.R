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


