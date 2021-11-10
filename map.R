<<<<<<< HEAD
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



=======
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
  )
>>>>>>> dc52e330a0f3f3b428b9ead23c4430863a5bf8ec
