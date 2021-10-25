library(shiny)


library(leaflet)


library(leaflet)
library(readr)



shinyServer(function(input,output) {
  wine_data2<- read_csv("Wine Location2.csv", stringsASFactors= FALSE)
  wine_data2<- data.frame(wine_data2)
  
  
  
  
  
  
  
  output$worldMap <- renderLeaflet({
    
    dataset <- read_excel("Wine Location.xlsx")
    View(dataset)
    
    #pull excell column for latitude, longitude, price, and points using readxl
    #look into if readxl:: col can take the excell sheet as an input 
    
    wine_lat <- readxl::cell_cols(L2:L992)
    wine_lon <- readxl::cell_cols(M2:M992)
    wine_price <- readxl::cell_cols(F2:F992)
    wine_rating <- readxl::cell_cols(E2:E992)
    
    wine_loc <- data.frame(wine_lat, wine_lon, wine_price, wine_rating, stringsAsFactors = FALSE)
    
    
    leaflet(data = wine_loc) %>%
      addTiles() %>% 
      addMarkers(~Longitude, ~Latitude) %>%
      addCircleMarkers(radius = ~points, label = ~winery)
  })
  
   
}
  

    

  
  

  
  
