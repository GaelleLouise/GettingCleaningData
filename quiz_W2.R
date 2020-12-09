# lecture JSON d'une API (question 1) :
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData) # donne les différentes "colonnes"
Nom_repo <- jsonData$name # stocke les différents noms de repository dans un vecteur
date_repo <- jsonData$created_at # stocke les différentes dates de création de repository dans un vecteur
date_repo[Nom_repo == "datasharing"] # affiche la date de création du repository intitulé "datasharing"

# lecture d'une page web :
connexion = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(connexion)
close(connexion)

# lecture d'un fichier en format fixe :
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
data <- read.fwf(file = fileURL, widths = c(10, 9, 4, 9, 4, 9, 4, 9, 4), # on peut spéciier des nb <0 pour sauter des colonnes
                 skip = 4, dec = ".")
sum(data$V4)
