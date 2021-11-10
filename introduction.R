#introduction page
library(shiny) 
library(shinydashboard)
library(markdown)

introductionText <- 
  fluidPage(
    titlePanel("Introduction"),
    column(width = 6, 
           box(
             title = "Wine History & Facts", width = NULL, background = "green", 
             "Wine has been a part of society for thousands of years, and the oldest winery in the world 
             was dated back to 4100 BC in Ancient Armenia. In these ancient times, due to its resemblance 
             to blood, wine was used mainly in religious ceremonies. It is even mentioned in the Bible. As 
             trade grew, wine was brought to the Greeks around 800 BC who expanded it with the Roman Empire 
             and the adoption of Christianity. Today, wine is made on every continent in the world except 
             Antarctica. The United States has grown to be the top wine consumers in the world."
           ),
           box(
             title = "Types of Wines", width = NULL, background = "green",
             "There are more than 10,000 varieties of grapes grown in the world, but there are about 17 
             types of wine made with combinations of these grapes. Types of red wine include: Pinot noir, 
             cabernet franc, cabernet sauvignon, carmenere, merlot, malbec, petit verdot, grenache, tempranillo, 
             primitivo, sangiovese, syrah/shiraz, and zinfandel. Types of white wine include: Chardonnay, 
             pinot grigio, sauvignon blanc, and riesling. These types of wine are categorized by taste in 
             4 ways: fruit, body, tanin, and acidity. "
           ),
           box(
             title = "About Grape Growing", width = NULL, background = "green",
             "Some vineyards plant multiple types of grapes, while others stick to one. It takes several 
             years after planting to get the first harvest of grapes, and the vines require a lot of 
             care in the meantime. Grape vines need a lot of water, pruning, and protection from disease, 
             insects, and animals. Taking good care of the grapes and being patient during the fermentation 
             process results in better wines. "
           ),
           box(
             title = "Grape Growing & Climate Change", width = NULL, background = "green",
             "Since grapes are grown on every continent in the world, the wine industry is very expansive.
             However, recent climate change may put grape growing in jeopardy. Different types of grapes 
             are grown optimally at different temperature ranges. While this allows for different areas 
             to make different wine based on the climate, if wine growers do not change the types of 
             grapes they grow the yield could decrease up to 56% with a temperature change of 2 degrees 
             Celcius. In this website, we want to share these risks while also offering an informative user
             experience about wines in general."
           )
        ),
    
    img(src = "GrapeVine.jpg", 
        height = "25%", 
        width = "50%", 
        align = "middle", 
        style="display: block; margin-left: auto; margin-right: auto;")
  )






