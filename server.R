library(dplyr)
library(shiny)
library(ggplot2)
library(DT)

#making a function that displays a map with the top rated wines by region
function (input, output) {
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

    
   # leaflet(wine_loc) %>%
   # addTiles()%>%
      #some lat and long values arent showing up 

     # addCircleMarkers(lng = ~Longitude, lat = ~Latitude, weight = 1, color= ~pal(points), popup = ~as.character(cntnt), clusterOptions = markerClusterOptions(showCoverageOnHover= TRUE, spiderfyOnMaxZoom = TRUE, zoomToBoundsOnClick = TRUE))%>%
     # addLegend(position = "bottomleft", pal= pal, values = ~points, title = "Wine By Rating")
 # observe( {
    #leafletProxy("wineMap", data = filteredData()) %>%
     # clearShapes() %>%
     # addCircleMarkers(lng = ~Longitude, lat = ~Latitude, 
                      # label = ~winery )
 # })
        #pal = color, 
        #title= "Wine by Rating"
    #  )
      #(wine_loc, position= "topright", pal=pal, values = wine_loc$points, opacity = 1, na.label = "Not Availible")
    

     # addCircleMarkers(lng = ~Longitude, 
                      # lat = ~Latitude,
                      # color = pal,
                      # popup = ~as.character(cntnt),
                       #clusterOptions = markerClusterOptions()) %>%
   #   addLegend(position = "bottomleft", 
               # values = ~points, 
               # pal= pal, 
               # title = "Wine By Rating")

   # })
   
    observe({
    btn <- input$newButton
    
  })
    output$data <- DT:: renderDataTable (datatable(
       wine_loc), filter= c("top", "none", "bottom"),
       colnames= c("Number", "Country", "Description","Designation", "Points", "Price", "Province", 
        "Region 1", "Region 2", "Variety", "Winery", "Lat", "Long"))
    
    
    
    
}
    
#getColor<- function(wine_loc) {
  #sapply(wine_loc$points, function(points) {
  #if (points<= 100 ) {
    #"green"
 ##} else if (points <= 99){
   # "orange"
  #} else {
   # "red"
 # }})
  

   #  })
  
  
  
#}


#function (input, output) {
  
  #output$data <- DT:: renderDataTable (datatable(
   # wine_loc), filter= "top", 
   # colnames= c("Country", "Description", "Points", "Price", "Province", 
               # "Region 1", "Region 2", "Variety", "Winery", "Lat", "Long"))
  
    #data <- wine_data
    #if (input$country != "ALL") {
      #data<- data[data$country == input$country,]
    #}
    #if (input$price != "ALL") {
      #data<- data[data$price == input$price,]
    #}
    #if (input$points != "ALL") {
      #data<- data[data$points == input$points,]
    #}
    #data
    
    
    #}))
  
  
  
  
#}


