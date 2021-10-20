library(shiny)
library(leaflet)
library(readxl)


function(input,output) {
  
  output$worldMap <- renderLeaflet({
    
    #pull excell columns for all columns of interest into wine_data using readxl::anchored
    #might not need this variable if you can pull direct columns into individual vairables 
    wine_data <- readxl::("Wine Location.xlsx")
    #pull excell column for latitude, longitude, price, and points using readxl
    #look into if readxl:: col can take the excell sheet as an input 
    wine_lat <- 
    wine_lon <- wine_data$Longitude
    wine_price <- wine_data$price
    wine_rating <- wine_data$points
    
    wine_loc <- data.frame(wine_lat, wine_lon, wine_price, wine_rating, stringsAsFactors = FALSE)
    
    
    leaflet(data = wine_loc) %>%
      addTiles() %>% 
      addMarkers(~Longitude, ~Latitude) %>%
      addCircleMarkers(radius = ~points, label = ~winery)
  })
  
   
}
  

    

  
  

  
  
