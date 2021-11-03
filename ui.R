
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
  navbarPage("Locations of Highly Ranked Wines", 
             id= "main",
             position = "static-top", 
           tabPanel("Introduction", 
                    h1("Wine History & Facts"),
                    p("Wine has been a part of society for thousands of years, and the oldest winery in the world was dated back to 4100 BC in Ancient Armenia. In these ancient times, due to its resemblance to blood, wine was used mainly in religious ceremonies. It is even mentioned in the Bible. As trade grew, wine was brought to the Greeks around 800 BC who expanded it with the Roman Empire and the adoption of Christianity. "),
                    br(),
                    h2("Types of Wines"),
                    p("There are more than 10,000 varieties of grapes grown in the world, but there are about 17 types of wine made with combinations of these grapes. Types of red wine include: Pinot noir, cabernet franc, cabernet sauvignon, carmenere, merlot, malbec, petit verdot, grenache, tempranillo, primitivo, sangiovese, syrah/shiraz, and zinfandel. Types of white wine include: Chardonnay, pinot grigio, sauvignon blanc, and riesling. These types of wine are categorized by taste in 4 ways: fruit, body, tanin, and acidity."),
                    br(),
                    h3("About Grape Growing"),
                    p("Some vineyards plant multiple types of grapes, while others stick to one. It takes several years after planting to get the first harvest of grapes, and the vines require a lot of care in the meantime. Grape vines need a lot of water, pruning, and protection from disease, insects, and animals. Taking good care of the grapes and being patient during the fermentation process results in better wines."),
                    br(),
                    h4("Grape Growing and Climate Change"),
                    p("Since grapes are grown on every continent in the world, the wine industry is very expansive. However, recent climate change may put grape growing in jeopardy. Different types of grapes are grown optimally at different temperature ranges. While this allows for different areas to make different wine based on the climate, if wine growers do not change the types of grapes they grow the yield could decrease up to 56% with a temperature change of 2 degrees Celcius. In this website, we want to share these risks while also offering an informative user experience about wines in general."),
                    br(),
                    img(src="GrapeVine.jpg", align="center")),
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
  
  

