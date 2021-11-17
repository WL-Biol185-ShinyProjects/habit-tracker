library(dplyr)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(tidyverse)
library(leaflet)
library(readr)
library(shinyWidgets)
library(markdown)

#source("introduction.R")
#source("map.R")
#source("dataTable.R")

#making a function that displays a map with the top rated wines by region
function (input, output) {

  dataset <- read.csv("Wine LocationFINAL.csv")
  #wine_loc<- read_csv(Wine_Location2, stringAsFactors= FALSE)

  wine_loc <- data.frame(dataset, stringAsFactors = FALSE)

  wine_loc <- read.csv("Wine Location2.csv")
  
  countrywineproduction<- read_csv("Country Wine Production.csv")
  worldwinevolume<- read_csv("World Wine Production Volume.csv")
  
  clean_wine <- read_csv("clean_wine.csv")
  cleaner_wine <- clean_wine %>%
    select(2:10) 
  cleanest_wine <- cleaner_wine[order(cleaner_wine$points, decreasing = TRUE), ]

  wine_loc$Latitude <- as.numeric(wine_loc$Latitude)
  wine_loc$Longitude <- as.numeric(wine_loc$Longitude)
  wine_loc$price <- as.numeric(wine_loc$price)
  wine_loc$points <- as.numeric(wine_loc$points)
  wine_loc$Latitude<- jitter(wine_loc$Latitude, factor = 0.01)
  wine_loc$Longitude<- jitter(wine_loc$Longitude, factor = 0.01)
            

  wine_loc <- mutate(wine_loc, cntnt= paste0('<strong>Winery: </strong>', winery,
                                            '<br><strong>Province:</strong>', province,
                                            '<br> <strong> Variety: </strong>', variety, 
                                            '<br><strong>Description: </strong>', description, 
                                            '<br><strong>Price$:</strong>', price, 
                                            '<br><strong>Rating: </strong>', points))
  filteredData<- reactive({
    if(input$country =="All countries") {
      wine_loc
    } else {
      filter(wine_loc, country == input$country)
    }
  })
                            
  #add 5 colors, make legend 
  
  your.data <- reactive({
    new <- cleanest_wine %>%
      filter(color == input$color) %>%
      filter(variety == input$variety) %>%
      filter(price >= input$price[1] & price <= input$price[2])
  })
  
  
  output$text <- renderText({"Based on your choices, here are 10 wines we recommend 
                              (sorted by WineEnthusiast Points):"})
  output$table <- renderTable({head(your.data(), 10)})
  
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
    output$wineplot<- renderPlot({
      barplot(WineOutput[,input$Country]*1000, 
              main=input$Country,
              ylab= "Wine production", 
              xlab= "Year")
    
    })
    output$data <- DT:: renderDataTable (datatable(
       wine_loc), filter= c("top", "none", "bottom"),
       colnames = c("Number", "Country", "Description", "Designation", "Points", "Price", "Province", "Region 1", "Region 2", "Variety", "Wineryy", "Lat", "Long"))
    
    output$worldvolumePlot<- renderPlot({
        ggplot(worldwinevolume, aes(Year, Mhl))+ 
        geom_point(color= "red", size= 3)+ 
        geom_smooth() +
        scale_x_continuous(breaks = c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021))
      #barplot(countrywineproduction [,input$country]*1000,
              #main= input$country,
              #ylab = "Mhl", 
              #xlab = "Year")
        
      })
    
}
