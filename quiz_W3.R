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

