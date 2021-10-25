library(shiny)
library(leaflet)
library(readr)


fluidPage(
  # map output 
  leafletOutput("wineMap"),
  
  # line break 
  br(), 
  
  # button 
  actionButton("newButton", "New wine!")
)


##navbarPage("Locations of Wines with Scores 100-96", id="main", 
           ##tabPanel("Map", leafletOutput("winemap", height=1000)), 
           ##tabPanel("Data", DT:: dataTableOutput("data")))

