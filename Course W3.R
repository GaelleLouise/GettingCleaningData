# data from the restaurants in Baltimore :
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/Restaurants.csv")
dateDownload <- date()

# stockage des données dans un df :
restData <- read.csv("./data/Restaurants.csv")

# 1er parcours des données :
head(restData)
tail(restData)
summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))

table(restData$zipCode == "21212")
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]
object.size(restData)

# répartir les données selon un quatile pour les catégoriser :
# ex : répartition de mes zipcodes selon les 0-25%, 25-50%, 50-75% et 75-100% des valeurs des zipcodes:
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups) # pour voir les groupes créés
table(restData$zipGroups,restData$zipCode) #pour voir la répartition des zipcodes sur les différents groupes

# pour répartir les zipcodes en 4 groupes (encore plus simple, en utilisant cut2 du package Hmisc) :
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g = 4)
table(restData$zipGroups)
