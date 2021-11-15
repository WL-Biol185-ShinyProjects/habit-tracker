
library(leaflet)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(markdown)
library(ggplot2)

#source pages here

#source("introduction.R")
#source("map.R")
#source("dataTable.R")
Country_Wine_Production <- read.csv("Country Wine Production.csv")

dashboardPage(skin = "red", 
              dashboardHeader(title = "Wine Dashboard", titleWidth = 600), 
              dashboardSidebar(width = 240,
                sidebarMenu(
                  menuItem("Introduction", tabName = "intro", icon = icon("info")), 
                  menuItem("Map", tabName = "map", icon = icon("map-marker-alt")), 
                  menuItem("Data Table", tabName = "datatable", icon = icon("wine-glass")),
                  menuItem("Wine Growth", tabName = "growth", icon = icon("chart-line")),
                  menuItem("References", tabName = "references", icon = icon("toolbox"))
                )
              ), 
              
              dashboardBody(
                tabItems(
                  tabItem(tabName = "intro", 
                          fluidRow(
                            titlePanel ("Introduction"),
                            box(
                              title = "Wine History & Facts", width = NULL, background = "red", 
                              "Wine has been a part of society for thousands of years, and the 
                              oldest winery in the world was dated back to 4100 BC in Ancient 
                              Armenia. In these ancient times, due to its resemblance to blood,
                              wine was used mainly in religious ceremonies. It is even mentioned 
                              in the Bible. As trade grew, wine was brought to the Greeks around 
                              800 BC who expanded it with the Roman Empire and the adoption of 
                              Christianity."), 
                            box(
                              title = "Types of Wines", width = NULL, background = "red", 
                              "There are more than 10,000 varieties of grapes grown in the world, 
                              but there are about 17 types of wine made with combinations of these
                              grapes. Types of red wine include: Pinot noir, cabernet franc, cabernet
                              sauvignon, carmenere, merlot, malbec, petit verdot, grenache, tempranillo,
                              primitivo, sangiovese, syrah/shiraz, and zinfandel. Types of white wine include: 
                              Chardonnay, pinot grigio, sauvignon blanc, and riesling. These types of wine are 
                              categorized by taste in 4 ways: fruit, body, tanin, and acidity."), 
                            box(
                              title = "About Grape Growing", width = NULL, background = "red", 
                              "Some vineyards plant multiple types of grapes, while others stick 
                              to one. It takes several years after planting to get the first harvest 
                              of grapes, and the vines require a lot of care in the meantime. Grape 
                              vines need a lot of water, pruning, and protection from disease, insects,
                              and animals. Taking good care of the grapes and being patient during the
                              fermentation process results in better wines."), 
                            box(
                              title = "Grape Growing and Climate Change", width = NULL, background = "red", 
                              "Since grapes are grown on every continent in the world, the wine industry is 
                              very expansive. However, recent climate change may put grape growing in jeopardy.
                              Different types of grapes are grown optimally at different temperature ranges. 
                              While this allows for different areas to make different wine based on the climate, 
                              if wine growers do not change the types of grapes they grow the yield could decrease
                              up to 56% with a temperature change of 2 degrees Celcius. In this website, we want 
                              to share these risks while also offering an informative user experience about wines 
                              in general."),
                            br(), 
                            div(img(src="GrapeVine.jpg"), style= "text-align: center;")
                           
                    
                            
                    
              )), 
                  tabItem(tabName = "map", 
                          fluidRow(
                            p("Choose a country to see each of its most highly ranked wines and their information!"), 
                            box(
                              width = 12,
                              title= "Locations of the Most Highly Ranked Wines", 
                              sidebarLayout(
                                
                                sidebarPanel( 
                                  selectInput(
                                    inputId = "country",
                                    label = "Select a country", 
                                    choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US"),
                                    selected = "country")), 
                                mainPanel(
                                    leafletOutput("wineMap")
                                  )
                                    )
                                ))), 
                          
                    tabItem(tabName = "datatable", 
                            fluidRow(
                              p("explain datatable here"), 
                              box(
                                title = "Complete Data Table of all Wines", 
                                width = 12, 
                                sidebarLayout(
                                  sidebarPanel(
                                    selectInput(
                                      inputId = "country",
                                      label = "Select a country ", 
                                      choices = list("All Countries", "Argentina", "Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US"))), 
                                 mainPanel(
                                        DT :: dataTableOutput ("data"))
                                        
                                      )
                                    )
                                  )
                         ), 
              
                    tabItem(tabName = "growth", 
                            fluidRow(
                            #fluidPage(
                              titlePanel= ("Changes in Wine Volume Production, unit=mhl"), 
                             # fluidRow(
                                tabBox(
                                  #title = "World Wide Changes",
                                  #tabPanel("World Wide", plotOutput("worldvolumePlot")
                                    
                                
                              sidebarLayout(
                                
                                sidebarPanel(
                                  selectInput("country", "Country:", choices = colnames(Country_Wine_Production)), 
                                  hr(), 
                                  helpText("Data From...")
                                ), 
                                mainPanel = (
                                  plotOutput("worldwineplot")
                                )
                                )
                             
                            )
                            
                      
                    )),
                                
                        tabItem(tabName = "references", 
                                fluidRow(
                                  titlePanel= ("References of Data Sets and Sources Used in this Dashboard"),
                                  
                                  p("insert links here")
                                )
                          
                                )
                              )))
                            
                    
    
                                
                                
                                
                                
                            
  ##Body content 

 # body <- dashboardBody(
  # tabItems(
     #Introductions
    # tabItem(
      # tabName = "Introduction", 
      # h1(
        # strong("Introduction")
     #  ),
       #fluidRow(
        # column(
           #width= 5,
          # box(
            # title= "Welcome", 
            # width = NULL, 
            # solidHeader = TRUE, 
           #  "Wine info"
          # ), 
           #box(
           #  title = "Links for more info", 
           #  background = "light-blue"
          # )
        # )))), 
        #tabItem(
         # tabName = "Map",
         # h1(
           # strong("Wine Map")
         # ), 
         # br(),
          #fluidRow(
           # box(
             # width = 12, 
             # background = "navy",
             # p("explain map")), 
           # sidebarLayout(
              #sidebarPanel(
                #selectInput(inputId= "country",
                            #label = "Select a country", 
                           # choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US")), 
              #mainPanel(
                  #leafletOutput(
                   # "wineMap", 
                   # height = 500
                 # )
                #)))), 
          #tabItem(
           # tabName = "Data Table", 
            #h1(
             # strong("Data Table of all wines")
           # ), 
            #br(), 
            #fluidRow(
             # mainPanel(
             # "Data",
             # DT::dataTableOutput("data"), 
             # fluidRow(column(2, selectInput("country", "Country:", c("All",unique(as.character(wine_loc$country)))
             # )))))),
#dashboardPage(

  #dashboardHeader(title = "Wine: Ratings, Locations, & Climate Change", titlewidth = 625), 
  #skin = "green", 
  #dashboardSidebar(
    #sidebarMenu(
      #menuItem("Introduction", 
               #tabName = "intro"), 
      #menuItem("Map of Highly Ranked Wines", 
               #tabName = "map"), 
      #menuItem("Data Table of Wines Around the World", 
               #tabName = "data"), 
      #menuItem("References", 
               #tabName = "references")
    #)
  #),

  #dashboardBody(
    #tabItems(
       #tabItem(tabName = "Introduction", introductionText),
       #tabItem(tabName = "Map", mapOutput), 
       #tabItem(tabName = "All Wines", wineData)
    #)

  #dashboardHeader(title = "Wine Info"), 
  #sidebar, 
 # body)
    
  

             # )

           # )
           # )
        #  )
                  
                #)
             #)
           # )
             # fluidRow(
              #  box(
                #  title= "map"
                  
               # ), 
               # box(
                 # title = "How to use this page", 
                  
               # )
             # ),
             # fluidRow(
               # sidebarPanel(
                 # mainPanel(tabPanel("Map", leafletOutput("wineMap", height= 500), absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" ))))
                 #   
                 # )
               # )
        
                
             # )
  # tabItem(tabName = "All Wines", wineData)
   # )

  #)
#)



#fluidPage(
 # map output 
  #titlePanel("The Locations of the Most Highly Rated Wines"),
  #mainPanel(leafletOutput("wineMap")
 

#))
 # navbarPage("Locations of Highly Ranked Wines", 
           #  id= "main",
           #  position = "static-top", 
           #tabPanel("Introduction", 
                  #  h1("Wine History & Facts"),
                  #  p("Wine has been a part of society for thousands of years, and the oldest winery in the world was dated back to 4100 BC in Ancient Armenia. In these ancient times, due to its resemblance to blood, wine was used mainly in religious ceremonies. It is even mentioned in the Bible. As trade grew, wine was brought to the Greeks around 800 BC who expanded it with the Roman Empire and the adoption of Christianity. "),
                  #  br(),
                  #  h2("Types of Wines"),
                   # p("There are more than 10,000 varieties of grapes grown in the world, but there are about 17 types of wine made with combinations of these grapes. Types of red wine include: Pinot noir, cabernet franc, cabernet sauvignon, carmenere, merlot, malbec, petit verdot, grenache, tempranillo, primitivo, sangiovese, syrah/shiraz, and zinfandel. Types of white wine include: Chardonnay, pinot grigio, sauvignon blanc, and riesling. These types of wine are categorized by taste in 4 ways: fruit, body, tanin, and acidity."),
                   # br(),
                   # h3("About Grape Growing"),
                   # p("Some vineyards plant multiple types of grapes, while others stick to one. It takes several years after planting to get the first harvest of grapes, and the vines require a lot of care in the meantime. Grape vines need a lot of water, pruning, and protection from disease, insects, and animals. Taking good care of the grapes and being patient during the fermentation process results in better wines."),
                   # br(),
                   # h4("Grape Growing and Climate Change"),
                   # p("Since grapes are grown on every continent in the world, the wine industry is very expansive. However, recent climate change may put grape growing in jeopardy. Different types of grapes are grown optimally at different temperature ranges. While this allows for different areas to make different wine based on the climate, if wine growers do not change the types of grapes they grow the yield could decrease up to 56% with a temperature change of 2 degrees Celcius. In this website, we want to share these risks while also offering an informative user experience about wines in general."),
                   # br(),
                   # img(src="GrapeVine.jpg", align="center")),
          # tabPanel("Map", leafletOutput("wineMap", height= 500), absolutePanel(top= 50, right = 10, selectInput(inputId="country", label = "Select a country to find its most highly rated wines!", choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US" )))), 
          
                   # sidebarLayout(
                    #  sidebarPanel(
                     #   selectInput("country","Country", 
                                  #  choices = colnames(Country)), 
                      #  mainPanel(
                    #  #  plotOutput("wineplot")
                    #  )
                    #  )
                  #  ),
           #tabPanel("Data", DT::dataTableOutput("data"), fluidRow(column(2, selectInput("country", "Country:",
                                                                                       #  c("All",
                                                                                         #  unique(as.character(wine_loc$country)))
                                                                                        

                                                                   
          # ))))))
  

