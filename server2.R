library(shiny)
library(leaflet)
library(readr)


function(input, output, session) {
  
  dataset <- read_csv("Wine Location2.csv")
  View(dataset)
  
  
  wine_lat <- dataset$Latitude
  wine_lon <- dataset$Longitude
  wine_price <- dataset$price
  wine_rating <- dataset$points
  
  wine_loc <- data.frame(wine_lat, wine_lon, wine_price, wine_rating, stringsAsFactors = FALSE)
  
  output$wineMap <- renderLeaflet({
    
    leaflet(data = wine_loc) %>%
      addTiles()
      #addMarkers(~Longitude, ~Latitude) %>%
      #addCircleMarkers(radius = ~points, label = ~winery)
      })
  
  observe({
    btn <- input$newButton
    
  })
  
   
}
  


