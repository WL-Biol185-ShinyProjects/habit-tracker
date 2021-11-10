#map.R
library(shiny)
library(leaflet)
library(shinydashboard)

mapOutput <- 
  fluidRow(
    box(
      titlePanel("Top Rated Wines Around the World"),
      leafletOutput("wineMap, height = 500"),
      absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" )))), 
    )