library(leaflet)
leaflet() %>% addTiles()
output$winemap <- renderLeaflet ({
  leaflet(wine_loc) %>%
    addCircles(lng = ~Longitude, lat = ~Latitude) %>%
    addTiles() %>%
    addCircleMarkers(data = wine_loc, lat = ~Latitude, lng = ~Longitude, 
                     radius = 3, popup = ~as.character(cntnt), 
                     color= ~pal(Category), 
                     stroke = FALSE, fillOpacity = 0.8)})



