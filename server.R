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
library(data.table)

#source("introduction.R")
#source("map.R")
#source("dataTable.R")

#making a function that displays a map with the top rated wines by region
function (input, output) {

  dataset <- read.csv("Wine LocationFINAL.csv")
  #wine_loc<- read_csv(Wine_Location2, stringAsFactors= FALSE)

  wine_loc <- data.frame(dataset, stringAsFactors = FALSE)

  wine_loc <- read.csv("Wine Location2.csv")
  DTWine <- readRDS("DTWine.Rds")
  
  countrywineproduction<- read.csv("Country Wine Production.csv")
  worldwinevolume<- read.csv("World Wine Production Volume.csv")
  worldtemp<- read.csv("WorldChangeInTemp.csv")
  winetempandvolume<- read.csv("winetempandvolume.csv")
  

  
  clean_wine <- read.csv("clean_wine.csv")
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
      filter(color == input$color)
    
    if(!is.null(input$variety)) {
      newer <- new %>%
      filter(variety == input$variety)}
    else{
      newer <- new
    }
      
    newest <- newer %>%
      filter(price >= input$price[1] & price <= input$price[2])
    
    newestest <- newest %>%
      head(input$number) %>%
      mutate(value_rating = points/price) 
  })
  
  output$text <- renderText({"Based on your choices, here are the wines we recommend 
                             (sorted by WineEnthusiast Points):"})
  output$table <- renderDataTable({
    your.data()
    })
  
  output$text2 <- renderText({"Here are the value ratings (Wine Enthusiast Points per Dollar) of the wines we found for you:"})
  
  output$plot <- renderPlot({
    ggplot(your.data(), aes(title, value_rating, fill = country)) + geom_bar(stat = 'identity') + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + xlab("Name of Wine") + ylab("Value Rating")
  })
  
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
    output$data <- DT:: renderDataTable (datatable(DTWine), colnames= c("Number", "Country", "Description", "Designation", "Points", "Price", "Province", "Region 1", "Region 2", "Variety", "Wineryy", "Lat", "Long"))
    
    output$worldvolumePlot<- renderPlot({
        ggplot(worldwinevolume, aes(Year, Mhl))+ 
        geom_point(color= "red", size= 3)+ 
        geom_smooth() +labs(y= "Worldwide Wine Grape Production (units: Mhl)")+
        scale_x_continuous(breaks = c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021))
      #barplot(countrywineproduction [,input$country]*1000,
              #main= input$country,
              #ylab = "Mhl", 
              #xlab = "Year")
        
      })
    output$volumetempPlot<- renderPlot({
      ggplot(winetempandvolume, aes(Temperature, Mhl))+ 
      geom_point(color= "red", size= 3)+ 
        geom_smooth() + labs(x= "Temperature Anomaly") +labs(y="Worldwide Wine Grape Production (units: Mhl)")
    })

    output$worldtempPlot<- renderPlot({
      ggplot(worldtemp, aes(Year, Temperature))+ 
        geom_point(color= "red", size= 3)+
        geom_smooth()+ labs(y= "Temperature Anomaly")
        
      
      
    }
      
    )
    
    output$downloadData <- downloadHandler(
      filename = function() {
        paste("clean_wine-", Sys.Date(), ".csv", sep ="")
      },
      content = function(con) {
        write.csv(clean_wine, con)
      }
    )
}

     
     
     
     
