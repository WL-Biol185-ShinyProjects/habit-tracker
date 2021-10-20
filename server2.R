library(shiny)

library(leaflet)



shinyServer(function(input,output) {
  
  wine_loc <- read_xlsx ("Wine Location.xlsx")
  wine_loc<- data.frame(wine_loc)
  wine_loc$Latitude<- as.numeric(wine_loc$Latitude)
  wine_loc$Longitude<- as.numeric(wine_loc$Longitude)
  wine_loc= filter(wine_loc, Latitude != "NA")
  
  wine_loc<- mutate(wine_loc, cntnt= paste0('<strong>Name: </strong>', variety, 
                                            '<br><strong> price: </strong>', price))
  output$winemap <- renderLeaflet ({
    leaflet(wine_loc) %>%
      addCircles(lng = ~Longitude, lat = ~Latitude) %>%
      addTiles() %>%
      addCircleMarkers(data = wine_loc, lat = ~Latitude, lng = ~Longitude, 
                       radius = 3, popup = ~as.character(cntnt), 
                       color= ~pal(Category), 
                       stroke = FALSE, fillOpacity = 0.8)})
    

  
  

  
  
  })

