
library(shiny)
library(leaflet)
library(shinydashboard)

#dashboardPage(
  #dashboardHeader(title = "Wine Data"), 
  #dashboardSidebar(
    #sidebarMenu(
    # menuItem("Introduction", 
              # tabName = "intro"), 
      #menuItem("Map of Highly Ranked Wines", 
               #tabName = "map"), 
     # menuItem("Data Table of Wines Around the World", 
               #tabName = "data"), 
      #menuItem("References", 
               #tabName = "references")
   # )
 # ), 
  #dashboardBody(
    #tabItems(
       #tabItem(tabName = "intro", 
            #fluidRow(
              #box(
                #title = "Place Introduction Info Here about importance and how to use", 
               # "Wine Importance, Variety, history", 
                #"Explain each tab and section"
            #  )
      #   )), 
       # tabItem(tabName = "map", 
            #fluidRow(
             # box(
                #title = "Locations of the Most Highly Rated Wines Across the World", 
               # background = "red", 
               # "Expain how to use here"
            #  )
         #   ), 
            #fluidRow(
                #sidebarPanel(
                 # selectInput(
                    #inputId = "countries", 
                    #label = "Select a country to find its most highly rated wines!", 
                    #choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" 
                   # )
            #  ), 
             # mainPanel(
                #leafletOutput("wineMap")
           # )
  #  ),
        #tabItem(tabName = "data", 
           # fluidRow(
             # box(
              #  title = "Wine Data Table", 
              #  background = "red", 
               # "Explain how to use here"
           # )
          # ),
          # fluidRow(
           #  mainPanel(
             #  DT:: dataTableOutput ("data")
            # )
          # )
      # ), 
             # mainPanel(
              #  DT:: dataTableOutput("data")
             # )
           # ),
    
    
    
       # tabItem(tabName = "references", 
           # fluidRow(
             # box(
              #  title = "References for our Data Sets", 
              #  background = "red")))))))
             
              
         #   )
          #  )
      
  #  )
    
 # )
#)



fluidPage(
 # map output 
  titlePanel("The Locations of the Most Highly Rated Wines"),
  mainPanel(leafletOutput("wineMap")
 

))
  navbarPage("Locations of Highly Ranked Wines", id= "main", position = "static-top", 
           tabPanel("Introduction"),
           tabPanel("Map", leafletOutput("wineMap", height= 500), absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" )))), 
           tabPanel("Data", DT::dataTableOutput("data"), fluidRow(column(2, selectInput("country", "Country:",
                                                                                         c("All",
                                                                                           unique(as.character(wine_loc$country)))))
                                                                   
                                                                          
            )))
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
  
  

