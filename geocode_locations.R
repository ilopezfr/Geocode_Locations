##install.packages("Rserve")
install.packages("Rserve", dependencies = TRUE)
install.packages("ggmap")
library("Rserve")
Rserve()
# The ggmap package will load from Tableau when necessary


library(ggmap)
geocode("someplace, nyc")


# address for the empire state building
mygeocode <- geocode("2421 N Clyborn Ave., Chicago, IL 60614", output = "more")
geocode("101 GRAND AVE  8902,	NORTH BRUNSWICK,	NJ")

mygeocode <- geocode("7129 O'KELLY CHAPEL RD,	27519,	CARY,	NC", output = "more")
mygeocode$loctype

qmap(location = c(lon = mygeocode$lon, lat = mygeocode$lat), zoom = 17, maptype = "satellite")

data <- read.csv("/Users/iglopezfrancos/Desktop/input.csv")
head(data)

Addresses = with(data, paste(Facility, StreetAddress1, Zip, City, State, sep = ","))
Locations = geocode(Addresses)

write.csv(Locations, file = "Locations.csv")
