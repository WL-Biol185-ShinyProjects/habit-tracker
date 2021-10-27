
library(shiny)
library(leaflet)


fluidPage(
  # map output 
  titlePanel("The Locations of the Most Highly Rated Wines"),
  mainPanel(leafletOutput("wineMap"))
 # absolutePanel(top= 10, right = 10,
                #selectInput(inputId= "country", 
                            #label = "country", 
                            #choices = "Argentina", "Australia", 
                            #"Austria", "France", "Germany", 
                           # "Hungary" ))
)
  #navbarPage("Locations of Highly Ranked Wines", id= "main", 
            #tabPanel("Map", leafletOutput("wineMap", height= 1000)), 
            # tabPanel("Data", DT::dataTableOutput("data")))
  # line break 
  #br(), 
  
  # button 
  #actionButton("newButton", "New wine!")
  
  #absolutePanel(top = 10, right = 10, 
               # selectInput("country"))
  #label= "Select a Country:", choices: list("US", "France"))

      
                 # 'live-search'=TRUE
                #)


#library(ggplot2)
#fluidPage(
  #titlePanel("Wine Data Table"), 
  #fluidRow(
    #column(2, 
          # selectInput("country", 
                      # "Country:", 
                      #c("All",
                        # unique(as.character(wine_data$country))))
    #), 
    #column (6, 
           # selectInput("price", 
                       # "Price:", 
                       # c("ALL", 
                         # unique(as.character(wine_data$price))))
        #    ), 
   # column (5, 
           # selectInput("points", 
                    #    "Points:", 
                      #  c("ALL", 
                    #      unique(as.character(wine_data$points))))
#    )
#  ), 
#  DT:: dataTableOutput("table")
                                                
#  )
  
  

