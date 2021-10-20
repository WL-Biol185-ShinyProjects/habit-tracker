
library(ggplot2)
fluidPage(
  titlePanel("Wine Data Table"), 
  fluidRow(
    column(2, 
           selectInput("country", 
                       "Country:", 
                       c("All",
                         unique(as.character(wine_data$country))))
    ), 
    column (6, 
            selectInput("price", 
                        "Price:", 
                        c("ALL", 
                          unique(as.character(wine_data$price))))
            ), 
    column (5, 
            selectInput("points", 
                        "Points:", 
                        c("ALL", 
                          unique(as.character(wine_data$points))))
    )
  ), 
  DT:: dataTableOutput("table")
                                                
  )
  
  
