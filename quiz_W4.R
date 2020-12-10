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
