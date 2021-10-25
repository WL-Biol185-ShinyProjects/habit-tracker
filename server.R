
library(shiny)
library(ggplot2)

#making a function that summarizes the data table
function (input, output) {
  dataset <- read.csv("Wine Location2.csv")
  #View(dataset)
  wine_loc <- data.frame(dataset, stringAsFactors = FALSE)
  
  wine_loc$Latitude <- as.numeric(wine_loc$Latitude)
  wine_loc$Longitude <- as.numeric(wine_loc$Longitude)
  wine_loc$price <- as.numeric(wine_loc$price)
  wine_loc$points <- as.numeric(wine_loc$points)
  
  output$wineMap <- renderLeaflet({
    
    leaflet(wine_loc) %>%
      addTiles()%>%
      addMarkers(~Longitude, ~Latitude) %>%
      addCircleMarkers(radius = ~points, label = ~winery)
  })
  
  observe({
    btn <- input$newButton
    
  })
}


#function (input, output) {
  
  #output$table <- DT:: renderDataTable(DT::datatable({ 
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


