library(shiny)
library(dplyr)
library(leaflet)
library(DT)


function(input,output) {
  
  leafletOutput$worldMap <-
  
    wine_data <- read_xlsx ("Wine Location.xlsx")
    wine_lat <- wine_data$Latitude
    wine_lon <- wine_data$Longitude
    wine_price <- wine_data$price
    wine_rating <- wine_data$points
  
    wine_loc <- data.frame(wine_lat, wine_lon, wine_price, wine_rating, stringsAsFactors = FALSE)
  
  
    leaflet(data = wine_loc) %>%
      addTiles() %>% 
      addMarkers(~Longitude, ~Latitude) %>%
      addCircleMarkers(radius = ~points, label = ~winery)
}
  

    

  
  

  
  
  })
