
library(ggplot2)

function (input, output) {
  
  output$table <- DT:: renderDataTable(DT::datatable({ 
    data <- wine_data
    if (input$country != "ALL") {
      data<- data[data$country == input$country,]
    }
    if (input$price != "ALL") {
      data<- data[data$price == input$price,]
    }
    if (input$points != "ALL") {
      data<- data[data$points == input$points,]
    }
    data
    
    
    }))
  
  
  
  
}


  
  
  
  
  
  
  
  
  
