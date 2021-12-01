
library(leaflet)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(tidyverse)
library(markdown)
library(ggplot2)


#source pages here

#source("introduction.R")
#source("map.R")
#source("dataTable.R")
Country_Wine_Production <- read.csv("Country Wine Production.csv")

dashboardPage(skin = "blue", 
              dashboardHeader(title = "Wine Dashboard", titleWidth = 600), 
              dashboardSidebar(width = 240,
                sidebarMenu(
                  menuItem("Introduction", tabName = "intro", icon = icon("info")), 
                  menuItem("Map", tabName = "map", icon = icon("map-marker-alt")), 
                  menuItem("Find a Wine!", tabName = "finder", icon = icon("search")),
                  menuItem("Wine Growth", tabName = "growth", icon = icon("chart-line")),
                  menuItem("Data Table", tabName = "datatable", icon = icon("wine-glass")),
                  menuItem("References", tabName = "references", icon = icon("toolbox"))
                )
              ), 
              
              dashboardBody(
                tabItems(
                  tabItem(tabName = "intro", 
                          fluidRow(
                            titlePanel ("Introduction"),
                            column(width = 6,
                                   box(
                                     title = "Wine History & Facts", width = NULL, background = "olive", 
                                     "Wine has been a part of society for thousands of years, and the 
                              oldest winery in the world was dated back to 4100 BC in Ancient 
                              Armenia. In these ancient times, due to its resemblance to blood,
                              wine was used mainly in religious ceremonies. It is even mentioned 
                              in the Bible. As trade grew, wine was brought to the Greeks around 
                              800 BC who expanded it with the Roman Empire and the adoption of 
                              Christianity."), 
                                   box(
                                     title = "Types of Wines", width = NULL, background = "olive", 
                                     "There are more than 10,000 varieties of grapes grown in the world, 
                              but there are about 17 types of wine made with combinations of these
                              grapes. Types of red wine include: Pinot noir, cabernet franc, cabernet
                              sauvignon, carmenere, merlot, malbec, petit verdot, grenache, tempranillo,
                              primitivo, sangiovese, syrah/shiraz, and zinfandel. Types of white wine include: 
                              Chardonnay, pinot grigio, sauvignon blanc, and riesling. These types of wine are 
                              categorized by taste in 4 ways: fruit, body, tanin, and acidity."),
                            box(
                              title="Goals of This App", width=NULL, background="olive",
                              "In this app, we hope to help viewers explore and fine new wines and vineyards
                              to find. We have a map of the location of the highest rated wines, and a data 
                              table and filtered page where individuals can explore and compare price, type 
                              of wine, and flavor profile. We also hope to educate viewers on the growing 
                              impact of climate change on grape growing. Climate change will have a large 
                              impact on the future of vineyards and what grapes they are able to grow."
                            )
                            ),
                            column(
                              width=6,
                              box(
                                title = "About Grape Growing", width = NULL, background = "olive", 
                                "Some vineyards plant multiple types of grapes, while others stick 
                              to one. It takes several years after planting to get the first harvest 
                              of grapes, and the vines require a lot of care in the meantime. Grape 
                              vines need a lot of water, pruning, and protection from disease, insects,
                              and animals. Taking good care of the grapes and being patient during the
                              fermentation process results in better wines."), 
                              box(
                                title = "Grape Growing and Climate Change", width = NULL, background = "olive", 
                                "Since grapes are grown on every continent in the world, the wine industry is 
                              very expansive. However, recent climate change may put grape growing in jeopardy.
                              Different types of grapes are grown optimally at different temperature ranges. 
                              While this allows for different areas to make different wine based on the climate, 
                              if wine growers do not change the types of grapes they grow the yield could decrease
                              up to 56% with a temperature change of 2 degrees Celcius. In this website, we want 
                              to share these risks while also offering an informative user experience about wines 
                              in general.")
                              ),
                            div(img(src="vineyard.jpg"), style= "text-align: center;")
                            
                                  )
                                ),
                  tabItem(tabName = "map", 
                          fluidRow(
                            box(
                              title= "Locations of the Most Highly Ranked Wines", 
                              "Within this interactive map, you will find each countries' most highly ranked wines along with each of their price, type, origin, and specific winery. ", 
                              background = "olive"), 
                            box(
                              title = "How To Use This Page", 
                              "Select a country to find its most highly rated and well known wines. Zoom in on certain clusters to see the various ratings within each country. Click on each bubble to find information on that specific wine.", 
                              background = "light-blue"
                              
                            ),
                            selectInput(inputId = "country", 
                                        label = "Select a Country", 
                                        choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US"), 
                                        selected = "country"), 
                            leafletOutput("wineMap")
                              
                            
                           # sidebarLayout(
                              #sidebarPanel(
                                #selectInput(
                                    #inputId = "country",
                                    #label = "Select a country", 
                                    #choices = list("All countries", "Argentina","Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US"),
                                    #selected = "country")), 
                              #mainPanel(leafletOutput("wineMap")
                                
                                  
                                    )),
                               
                        
                    tabItem(tabName = "finder",
                            fluidPage(
                              titlePanel("Find a Wine!"),
                              sidebarLayout(
                                sidebarPanel(
                                  radioButtons("color", label = "What color?", 
                                               choices = list("Red", "White"), selected = 1),
                                  selectizeInput("variety", 
                                                 "Any variety in particular? 
                     *Note: You can select as many as you'd like or you do not have to select anything!",
                                                 choices = list("Abouriou", "Agiorgitiko", "Aglianico", "Aidani", "Airen", "Albana", 
                                                                "Albanello", "Albariño", "Albarossa", "Aleatico", "Alfrocheiro", "Alicante", 
                                                                "Alicante Bouschet", "Aligoté", "Alsace white blend", "Altesse", "Alvarelhão", 
                                                                "Alvarinho", "Alvarinho-Chardonnay", "Ansonica", "Antão Vaz", "Apple", 
                                                                "Aragonês", "Aragonez", "Argaman", "Arinto", "Arneis", "Asprinio", "Assyrtico", 
                                                                "Assyrtiko", "Athiri", "Austrian Red Blend", "Austrian white blend", "Auxerrois", 
                                                                "Avesso", "Azal", "Babic", "Babosa Negro", "Bacchus", "Baco Noir", 
                                                                "Baga-Touriga Nacional", "Barbera", "Barbera-Nebbiolo", "Bastardo", "Biancale", 
                                                                "Biancolella", "Biancu Gentile", "Bical", "Black Muscat", "Blanc du Bois", "Blatina", 
                                                                "Blauburger", "Blauburgunder", "Blauer Portugieser", "Blaufränkisch", "Bobal", 
                                                                "Bobal-Cabernet Sauvignon", "Bogazkere", "Bombino Bianco", "Bombino Nero", 
                                                                "Bonarda", "Bordeaux-style Red Blend", "Bordeaux-style White Blend", "Bovale", 
                                                                "Brachetto", "Braucol", "Bual", "Cabernet", "Cabernet Blend", "Cabernet Franc", 
                                                                "Cabernet Franc-Cabernet Sauvignon", "Cabernet Franc-Carmenère", 
                                                                "Cabernet Franc-Lemberge", "Cabernet Franc-Malbec", "Cabernet Franc-Merlot", 
                                                                "Cabernet Merlot", "Cabernet Moravia", "Cabernet Pfeffer", "Cabernet Sauvignon", 
                                                                "Cabernet Sauvignon Grenache", "Cabernet Sauvignon-Barbera", 
                                                                "Cabernet Sauvignon-Cabernet Franc", "Cabernet Sauvignon-Carmenère", 
                                                                "Cabernet Sauvignon-Malbec", "Cabernet Sauvignon-Merlot", "Cabernet Sauvignon-Merlot-Shiraz", 
                                                                "Cabernet Sauvignon-Sangiovese", "Cabernet Sauvignon-Shiraz", "Cabernet Sauvignon-Syrah", 
                                                                "Cabernet Sauvignon-Tempranillo", "Cabernet-Malbec", "Cabernet-Shiraz", "Cabernet-Syrah", 
                                                                "Çalkarasi", "Canaiolo", "Cannonau", "Caprettone", "Carcajolu", "Carignan", "Carignan-Grenache", 
                                                                "Carignan-Syrah", "Carignane", "Carignano", "Carineña", "Cariñena-Garnacha", "Carmenère", 
                                                                "Carmenère-Cabernet Sauvignon", "Carmenère-Syrah", "Carricante", "Casavecchia", "Castelão", 
                                                                "Catalanesca", "Catarratto", "Cayuga", "Centesimino", "Cerceal", "Cercial", "Cesanese", 
                                                                "Cesanese d'Affile", "Chambourcin", "Champagne Blend", "Chancellor", "Charbono", "Chardonel", 
                                                                "Chardonnay", "Chardonnay Weissburgunder", "Chardonnay-Albariño", "Chardonnay-Pinot Blanc", 
                                                                "Chardonnay-Pinot Gris", "Chardonnay-Riesling", "Chardonnay-Sauvignon", 
                                                                "Chardonnay-Sauvignon Blanc", "Chardonnay-Semillon", "Chardonnay-Viognier", "Chasselas", 
                                                                "Chelois", "Chenin Blanc", "Chenin Blanc-Chardonnay", "Chenin Blanc-Sauvignon Blanc", 
                                                                "Chenin Blanc-Viognier", "Chinuri", "Ciliegiolo", "Cinsault", "Clairette", "Claret", 
                                                                "Cococciola", "Coda di Volpe", "Códega do Larinho", "Colombard", "Colombard-Sauvignon Blanc", 
                                                                "Colombard-Ugni Blanc", "Colorino", "Cortese", "Corvina", "Corvina, Rondinella, Molinara", 
                                                                "Counoise", "Dafni", "Debit", "Diamond", "Dolcetto", "Doña Blanca", "Dornfelder", "Duras", 
                                                                "Durella", "Durif", "Edelzwicker", "Ekigaïna", "Elbling", "Emir", "Encruzado", "Erbaluce", 
                                                                "Espadeiro", "Falanghina", "Favorita", "Fer Servadou", "Fernão Pires", "Feteasca", 
                                                                "Feteasca Neagra", "Feteasca Regala", "Fiano", "Folle Blanche", "Forcallà", "Francisa", 
                                                                "Franconia", "Frankovka", "Frappato", "Freisa", "Friulano", "Früburgunder", "Fumé Blanc", 
                                                                "Furmint", "G-S-M", "Gaglioppo", "Gamay", "Gamay Noir", "Gamza", "Garganega", "Garnacha", 
                                                                "Garnacha Blanca", "Garnacha Blend", "Garnacha Tintorera", "Garnacha-Cabernet", 
                                                                "Garnacha-Cariñena", "Garnacha-Monastrell", "Garnacha-Syrah", "Garnacha-Tempranillo", 
                                                                "Gelber Muskateller", "Gelber Traminer", "Gewürztraminer", "Gewürztraminer-Riesling", 
                                                                "Glera", "Godello", "Gouveio" , "Graciano", "Gra\u009aevina", "Gragnano", "Grauburgunder", 
                                                                "Grecanico", "Grechetto", "Greco", "Greco Bianco", "Grenache", "Grenache Blanc", 
                                                                "Grenache Blend", "Grenache Gris", "Grenache Noir", "Grenache-Carignan", "Grenache-Mourvèdre", 
                                                                "Grenache-Shiraz", "Grenache-Syrah", "Grignolino", "Grillo", "Grolleau", "Groppello", 
                                                                "Gros and Petit Manseng", "Gros Manseng", "Gros Plant", "Grüner Veltliner", "Hárslevelü", 
                                                                "Hondarrabi Zuri", "Incrocio Manzoni", "Insolia", "Inzolia", "Irsai Oliver", "Jacquère", 
                                                                "Jacquez", "Jaen", "Jampal", "Johannisberg Riesling", "Kadarka", "Kalecik Karasi", "Kangoun", 
                                                                "Karalahna", "Karasakiz", "Kekfrankos", "Kerner", "Kinali Yapincak", "Kisi", "Kotsifali", 
                                                                "Kuntra", "Lagrein", "Lambrusco", "Lambrusco di Sorbara", "Lambrusco Grasparossa", 
                                                                "Lambrusco Salamino", "Lemberger", "Listán Negro", "Loin de l'Oeil", "Loureiro", "Loureiro-Arinto", 
                                                                "Macabeo", "Macabeo-Chardonnay", "Macabeo-Moscatel", "Madeira Blend", "Madeleine Angevine", 
                                                                "Magliocco", "Malagousia", "Malagouzia", "Malagouzia-Chardonnay", "Malbec", "Malbec Blend", 
                                                                "Malbec-Bonarda", "Malbec-Cabernet", "Malbec-Cabernet Franc", "Malbec-Cabernet Sauvignon", 
                                                                "Malbec-Carménère", "Malbec-Merlot", "Malbec-Petit Verdot", "Malbec-Syrah", "Malbec-Tannat", 
                                                                "Malbec-Tempranillo", "Malvar", "Malvasia", "Malvasia Bianca", "Malvasia di Candia", 
                                                                "Malvasia Fina", "Malvasia Istriana", "Malvasia Nera", "Malvasia-Viura", "Mandilaria", 
                                                                "Mansois", "Mantonico", "Manzoni", "Marawi", "Maria Gomes", "Maria Gomes-Bical", "Marquette", 
                                                                "Marsanne", "Marsanne-Roussanne", "Marsanne-Viognier", "Marselan", "Marzemino", "Mataro", 
                                                                "Maturana", "Mavrodaphne", "Mavrokalavryta", "Mavrotragano", "Mavroudi", "Mavrud", "Mazuelo", "Melnik", "Melon", "Mencía", "Meritage", "Merlot", "Merlot-Argaman", "Merlot-Cabernet", "Merlot-Cabernet Franc", "Merlot-Cabernet Sauvignon", "Merlot-Grenache", "Merlot-Malbec", "Merlot-Petite Verdot", "Merlot-Shiraz", "Merlot-Syrah", "Merlot-Tannat", "Merseguera-Sauvignon Blanc", "Meseguera", "Misket", "Mission", "Molinara", "Monastrell", "Monastrell-Petit Verdot", "Monastrell-Syrah", "Mondeuse", "Monica", "Montepulciano", "Morava", "Morillon", "Morio Muskat", "Moscadello", "Moscatel", "Moscatel de Alejandría", "Moscatel Graúdo", "Moscatel Roxo", "Moscato", "Moscato di Noto", "Moscato Giallo", "Moscato Rosa", "Moschofilero", "Moschofilero-Chardonnay", "Mourvèdre", "Mourvèdre-Syrah", "Mtsvane", "Müller-Thurgau", "Muscadel", "Muscadelle", "Muscadine", "Muscat", "Muscat Blanc", "Muscat Blanc à Petits Grains", "Muscat Canelli", "Muscat d'Alexandrie", "Muscat Hamburg", "Muscat of Alexandria", "Muscatel", "Muskat", "Muskat Ottonel", "Muskateller", "Narince", "Nascetta", "Nasco", "Nebbiolo", "Negrette", "Negroamaro", "Nerello Cappuccio", "Nerello Mascalese", "Nero d'Avola", "Nero di Troia", "Neuburger", "Nielluciu", "Norton", "Nosiola", "Nuragus", "Ojaleshi", "Okuzgozu", "Ondenc", "Orange Muscat", "Orangetraube", "Other", "Otskhanuri Sapere", "País", "Pallagrello", "Pallagrello Blanco", "Pallagrello Nero", "Palomino", "Pansa Blanca", "Papaskarasi", "Paralleda", "Parraleta", "Passerina", "Pecorino", "Pedro Ximénez", "Perricone", "Petit Courbu", "Petit Manseng", "Petit Meslier", "Petit Verdot", "Petite Sirah", "Petite Verdot", "Picapoll", "Picolit", "Picpoul", "Piedirosso", "Pigato", "Pignoletto", "Pignolo", "Pinot Auxerrois", "Pinot Bianco", "Pinot Blanc", "Pinot Blanc-Chardonnay", "Pinot Blanc-Pinot Noir", "Pinot Blanc-Viognier", "Pinot Grigio", "Pinot Grigio-Sauvignon Blanc", "Pinot Gris", "Pinot Gris-Gewürztraminer", "Pinot Meunier", "Pinot Nero", "Pinot Noir", "Pinot Noir-Gamay", "Pinot Noir-Syrah", "Pinot-Chardonnay", "Pinotage", "Pinotage-Merlot","Piquepoul Blanc", "Plavac Mali", "Plyto","Port", "Portuguese Red", "Portuguese Rosé", "Portuguese Sparkling", "Portuguese White", "Portuguiser", "Posip", "Poulsard", "Premsal", "Prié Blanc", "Prieto Picudo", "Primitivo", "Prosecco", "Provence red blend", "Provence white blend", "Prugnolo Gentile", "Prunelard", "Pugnitello", "Rabigato", "Raboso", "Ramisco", "Rara Neagra", "Rebo", "Rebula" , "Red Blend", "Refosco", "Rhône-style Red Blend", "Rhône-style White Blend", "Ribolla Gialla", "Rieslaner", "Riesling", "Riesling-Chardonnay", "Rivaner", "Rkatsiteli", "Robola", "Roditis", "Roditis-Moschofilero", "Rolle", "Romorantin",  "Rosado", "Rosato", "Roscetto", "Rosé", "Rosenmuskateller", "Roter Traminer", "Roter Veltliner", "Rotgipfler", "Roussanne", "Roussanne-Grenache Blanc", "Roussanne-Marsanne", "Roussanne-Viognier", "Roviello", "Ruché", "Rufete", "Ryzlink Rýnský", "Sacy", "Sagrantino", "Sämling", "Sangiovese", "Sangiovese Cabernet", "Sangiovese Grosso", "Sangiovese-Cabernet Sauvignon", "Sangiovese-Syrah", "Saperavi", "Saperavi-Merlot", "Sauvignon", "Sauvignon Blanc", "Sauvignon Blanc-Assyrtiko", "Sauvignon Blanc-Chardonnay", "Sauvignon Blanc-Chenin Blanc", "Sauvignon Blanc-Sauvignon Gris", "Sauvignon Blanc-Semillon", "Sauvignon Blanc-Verdejo", "Sauvignon Gris", "Sauvignon Musqué", "Sauvignon-Sémillon", "Sauvignonasse", "Savagnin", "Savatiano", "Scheurebe", "Schiava", "Schwartzriesling", "Sciaccerellu", "Sémillon", "Semillon-Chardonnay", "Semillon-Sauvignon Blanc", "Sercial", "Seyval Blanc", "Sherry", "Shiraz", "Shiraz-Cabernet", "Shiraz-Cabernet Sauvignon", "Shiraz-Grenache", "Shiraz-Malbec", "Shiraz-Mourvèdre", "Shiraz-Roussanne", "Shiraz-Tempranillo", "Shiraz-Viognier", "Sideritis", "Siegerrebe", "Silvaner", "Silvaner-Traminer", "Siria", "Sirica", "Sousão", "Souzao", "Sparkling Blend", "Spätburgunder", "St. Laurent", "St. Vincent", "Susumaniello", "Sylvaner", "Symphony", "Syrah", "Syrah-Bonarda", "Syrah-Cabernet", "Syrah-Cabernet Franc", "Syrah-Cabernet Sauvignon", "Syrah-Carignan", "Syrah-Grenache","Syrah-Grenache-Viognier", "Syrah-Malbec", "Syrah-Merlot", "Syrah-Mourvèdre", "Syrah-Petit Verdot", "Syrah-Petite Sirah", "Syrah-Tempranillo", "Syrah-Viognier", "Tămâioasă Românească", "Tamianka", "Tamjanika", "Tannat", "Tannat-Cabernet", "Tannat-Cabernet Franc", "Tannat-Merlot", "Tannat-Syrah", "Tempranillo", "Tempranillo Blanco", "Tempranillo Blend", "Tempranillo-Cabernet Sauvignon", "Tempranillo-Garnacha", "Tempranillo-Malbec", "Tempranillo-Merlot", "Tempranillo-Shiraz", "Tempranillo-Syrah", "Tempranillo-Tannat", "Teran", "Teroldego", "Teroldego Rotaliano", "Terrantez", "Thrapsathiri", "Timorasso", "Tinta Amarela", "Tinta Barroca", "Tinta Cao", "Tinta de Toro", "Tinta del Pais", "Tinta del Toro", "Tinta Fina", "Tinta Francisca", "Tinta Madeira", "Tinta Miúda", "Tinta Negra Mole", "Tinta Roriz", "Tintilia", "Tinto del Pais", "Tinto Fino", "Tinto Velasco", "Tocai", "Tocai Friulano", "Tokaji", "Tokay", "Tokay Pinot Gris", "Torbato", "Torontel", "Torrontés", "Touriga", "Touriga Franca", "Touriga Nacional", "Touriga Nacional Blend", "Touriga Nacional-Cabernet Sauvignon", "Trajadura", "Traminer", "Traminette", "Trebbiano", "Trebbiano di Lugana", "Trebbiano Spoletino", "Treixadura", "Trepat", "Trincadeira", "Trollinger", "Trousseau", "Trousseau Gris", "Tsapournakos", "Tsolikouri", "Turbiana", "Ugni Blanc", "Ugni Blanc-Colombard", "Uva di Troia", "Uvalino", "Valdiguié", "Valvin Muscat", "Veltliner", "Verdeca", "Verdejo", "Verdejo-Sauvignon Blanc", "Verdejo-Viura", "Verdelho", "Verdicchio", "Verdil", "Verdosilla", "Verduzzo", "Verduzzo Friulano", "Vermentino", "Vermentino Nero", "Vernaccia", "Vespaiolo", "Vespolina", "Vidadillo", "Vidal", "Vidal Blanc", "Vignoles", "Vilana", "Vinhão", "Viognier", "Viognier-Chardonnay", "Viognier-Gewürztraminer", "Viognier-Grenache Blanc", "Viognier-Marsanne", "Viognier-Roussanne", "Viognier-Valdiguié", "Viosinho", "Vital", "Vitovska", "Viura", "Viura-Chardonnay", "Viura-Verdejo", "Vranac", "Vranec", "Weissburgunder", "Welschriesling", "White Blend", "White Port", "White Riesling", "Xarel-lo", "Xinisteri", "Xinomavro", "Xynisteri", "Yapincak", "Zelen", "Zibibbo", "Zierfandler-Rotgipfler", "Zinfandel", "Zlahtina", "Zweigelt"),
                                                 multiple = TRUE, selected = NULL),
                                  sliderInput("price", label = "Price Range", min = 5, max = 500, value = c(5, 500)),
                                  sliderInput("number", label = "How many results would you like to see?", min = 1, max = 50, value = 15),
                                  actionButton("submit", "Find my wine!")
                                ),
                                mainPanel(
                                  tabsetPanel(type = "tabs", 
                                              tabPanel("Table", 
                                                       textOutput("text"),
                                              tableOutput("table")), 
                                              tabPanel("Graph", plotOutput("plot"))
                              )
                            )  
                            ))),
              
                    tabItem(tabName = "growth", 
                          
                           fluidPage(
                             titlePanel= "TITLE", 
                               fluidRow(
                                 tabBox(
                                  width = 6, side= "left", 
                                  tabPanel("Yearly Worldwide Wine Production, units:mhl", plotOutput("worldvolumePlot", width = "100%"))), 
                                  
                                  tabBox(
                                    width = 6, side = "right",
                                    tabPanel("Global Temperature Anomaly Changes Over Time", plotOutput("worldtempPlot"), width= "100%"))
                                
                              ) , 
                    
                              fluidRow(
                                box( title = "Climate Change's Impact on Wine Production", width = NULL, background = "olive",
                                     "Wine grapes around the world are all sensitive to temperature and moisture changes. These rising global temperatures are causing wine grapes to ripen faster leading to sweeter and more alcoholic wines."
                                  #tabPanel("Global Temperature Anomaly Changes Over Time", plotOutput("worldtempPlot"))
                                ), 
                                box(title= "Cooler Conditions",
                                    "Less ripeness in fruit, more tart, higher acidity, lower sugar, and lower alchohol content.", 
                                    width = 6, side= "left", background = "blue"), 
                                box(title= "Warmer Conditions", "More ripeness in fruit, softer and sweeter fruit flavor, lower acidity, higher sugar, and higher alcohol content.",  width = 6, side= "right", background = "red")
                              )
                                    
                                
                              #sidebarLayout(
                                
                               # sidebarPanel(
                                 # selectInput("country", "Country:", choices = colnames(Country_Wine_Production)), 
                                 # hr(), 
                                 # helpText("Data From...")
                              #  ), 
                               # mainPanel = (
                                 # plotOutput("worldwineplot")
                                )
                                
                             
                            
                            
                      
                    ),
                  
                  tabItem(tabName = "datatable", 
                          titlePanel("Data Explorer"),
                          fluidPage(
                            div(dataTableOutput("data")),
                            downloadButton("downloadData", label = "Download")
                            # p("explain datatable here"), 
                            # box(
                            # title = "Complete Data Table of all Wines", 
                            # width = 12, 
                            #sidebarLayout(
                            # sidebarPanel(
                            #selectInput(
                            #inputId = "country",
                            # label = "Select a country ", 
                            #choices = list("All Countries", "Argentina", "Australia", "Austria", "France", "Germany", "Italy", "Portugal", "Spain", "US"))), 
                            # mainPanel(
                            # DT :: dataTableOutput ("data"))
                            
                            
                            
                          )
                  ) ,
                                
                        tabItem(tabName = "references", 
                                titlePanel("References for Data Sets and Sources used in this Dashboard"),
                                fluidRow(
                                  column(width=6,
                                  box("1. Average Temperature per country per year. (n.d.). Retrieved November 29, 2021, from   
https://kaggle.com/akshaychavan/average-temperature-per-country-per-year", side= "left", width= NULL), 
                                  box("2. Climate Change Is Rapidly Altering Wine As We Know It | Wine Enthusiast. (n.d.). Retrieved  
November 29, 2021, from https://www.winemag.com/2020/02/03/wine-climate-change/", side= "left", width= NULL), 
                                  box("3. How Wine Lovers Geek Out: The Best Insider Websites—WSJ. (n.d.). Retrieved November 29,  
2021, from https://www.wsj.com/articles/how-wine-lovers-geek-out-the-best-insider-	
websites-11632412835?mod=article_relatedinline", side= "left", width= NULL), 
                                  box("4. The History Of Wine Timeline | How Wine Colonized The World. (n.d.). VinePair. Retrieved  
November 29, 2021, from https://vinepair.com/wine-colonized-world-wine-history/", side= "left", width= NULL), 
                                  box("5. Updated Wine Enthusiast Reviews. (n.d.). Retrieved November 29, 2021, from  
https://kaggle.com/manyregression/updated-wine-enthusiast-review", side= "left", width= NULL), 
                                  box("6. What Are the Different Types of Wine Grapes? A Guide to the Various Types of Red and White  
Wine Grapes in the World—2021—MasterClass. (n.d.). Retrieved November 29, 2021, 	
from https://www.masterclass.com/articles/what-are-the-different-types-of-wine-grapes-	
a-guide-to-the-various-types-of-red-and-white-wine-grapes-in-the-world#what-are-the 	
different-red-wine-grapes", side= "left", width= NULL), 
                                  box("7. What Climate Change Might Do to Your Favorite Wine—WSJ. (n.d.). Retrieved November 29,  
2021, from https://www.wsj.com/articles/what-climate-change-might-do-to-your-	
favorite-wine-11628778962", side= "left", width= NULL), 
                                  box("8. Wine Reviews. (n.d.). Retrieved November 29, 2021, from https://kaggle.com/zynicide/wine-	
reviews 
", side= "left", width= NULL))
                                )
                          
                                )
                        )
              )

)


                            
                    
    
                                
                                
                                
                                
                            
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
  

