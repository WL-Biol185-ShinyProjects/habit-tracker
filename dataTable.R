#dataTable.R
library(shiny)
library(leaflet)
library(shinydashboard)

wineData <- 
  fluidPage(
    DT::dataTableOutput("data"), 
    fluidRow(column(2, selectInput("country", "Country:", c("All", unique(as.character(wine_loc$country)
                                                                          )
                                                            )
                                   )
                    )
             )
  )