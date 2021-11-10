library(dplyr)
library(shiny)
library(ggplot2)
library(DT)

#making a function that displays a map with the top rated wines by region
function (input, output) {

  dataset <- read.csv("Wine LocationFINAL.csv")
  #wine_loc<- read_csv(Wine_Location2, stringAsFactors= FALSE)

  wine_loc <- data.frame(dataset, stringAsFactors = FALSE)

  wine_loc <- read.csv("Wine Location2.csv")

  wine_loc$Latitude <- as.numeric(wine_loc$Latitude)
  wine_loc$Longitude <- as.numeric(wine_loc$Longitude)
  wine_loc$price <- as.numeric(wine_loc$price)
  wine_loc$points <- as.numeric(wine_loc$points)
  wine_loc$Latitude<- jitter(wine_loc$Latitude, factor = 0.01)
  wine_loc$Longitude<- jitter(wine_loc$Longitude, factor = 0.01)
            

  wine_loc<- mutate(wine_loc, cntnt= paste0('<strong>Winery: </strong>', winery,
                                            '<br><strong>Province:</strong>', province,
                                            '<br> <strong> Variety: </strong>', variety, 
                                            '<br><strong>Description: </strong>', description, 
                                            '<br><strong>Price$:</strong>', price, 
                                            '<br><strong>Rating: </strong>', points))
  filteredData<- reactive({
    if(input$country =="All countries") {
      wine_loc
    } else {
      filter(wine_loc, country== input$country)
    }
  })
                            
  #add 5 colors, make legend 
  
 pal <- colorFactor(pal = c("green", "blue", "purple", "yellow", "black"), domain = c("96", "97", "98", "99", "100"))
  
  output$wineMap <- renderLeaflet({
    leaflet(filteredData())%>%
      addTiles() %>%
      addCircleMarkers(lng = ~Longitude, lat = ~Latitude, weight = 1, color = ~pal(points), popup= ~as.character(cntnt), clusterOptions = markerClusterOptions(showCoverageOnHover = TRUE, spiderfyOnMaxZoom = TRUE, zoomToBoundsOnClick = TRUE)) %>%
      addLegend(position = "bottomleft", pal = pal, values = ~points, title = "Wine By Rating")
  })
  
  observe ({
    leafletProxy("wineMap", data = filteredData()) %>%
      clearShapes() %>%
      addTiles() %>%
      addCircleMarkers(lng = ~Longitude, lat = ~Latitude, weight = 1,color = ~pal(points),popup= ~as.character(cntnt), clusterOptions = markerClusterOptions(showCoverageOnHover = TRUE, spiderfyOnMaxZoom = TRUE,zoomToBoundsOnClick = TRUE))
     # addLegend(position = "bottomleft", pal = pal, values = ~points, title = "Wine By Rating")
                   
  })
   
    observe({
    btn <- input$newButton
    
  })
    output$data <- DT:: renderDataTable (datatable(
       wine_loc), filter= c("top", "none", "bottom"),
       colnames= c("Number", "Country", "Description","Designation", "Points", "Price", "Province", 
        "Region 1", "Region 2", "Variety", "Winery", "Lat", "Long"))
    
}
