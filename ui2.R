library(shiny)
library(leaflet)
library(dplyr)



navbarPage("Locations of Wines with Scores 100-96", id="main", 
           tabPanel("Map", leafletOutput("winemap", height=1000)), 
           tabPanel("Data", DT:: dataTableOutput("data")))

