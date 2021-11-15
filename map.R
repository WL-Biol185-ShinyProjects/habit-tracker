
library(leaflet)
library(shiny)
library(leaflet)

#map.R

mapOutput <- 
  fluidRow(
    box(
      titlePanel("Top Rated Wines Around the World"),
      leafletOutput("wineMap, height = 500"),
<<<<<<< HEAD
      absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" )))), 
    )
=======
      absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" )))) 
    )
  
>>>>>>> 2e58aec90dfb09a68078fb3da55813679bb35264
