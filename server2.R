library(shiny)
library(dplyr)
library(leaflet)
library(DT)


function(input,output) {
  
  leafletOutput$worldMap <-
  
    wine_data <- read_xlsx ("Wine Location.xlsx")
  ##wine_loc<- data.frame(wine_loc)
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
  
  ##wine_loc$Latitude<- as.numeric(wine_loc$Latitude)
  ##wine_loc$Longitude<- as.numeric(wine_loc$Longitude)
  ##wine_loc= filter(wine_loc, Latitude != "NA")
  
  ##wine_loc<- mutate(wine_loc, cntnt= paste0('<strong>Name: </strong>', variety, 
                                            ##'<br><strong> price: </strong>'
  ##output$winemap <- renderLeaflet ({
    ##leaflet(wine_loc) %>%
      ##addCircles(lng = ~Longitude, lat = ~Latitude) %>%
      ##addTiles() %>%
      ##addCircleMarkers(data = wine_loc, lat = ~Latitude, lng = ~Longitude, 
                       ##radius = 3, popup = ~as.character(cntnt), 
                       ##color= ~pal(Category), 
                       ##stroke = FALSE, fillOpacity = 0.8)})
    

  
  

  
  
  })
