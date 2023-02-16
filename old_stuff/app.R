library(shiny)

source("vot.R")


# Define UI ----
ui <- fluidPage(
    titlePanel("Votations fédérales"),
    
    fluidRow(column(8, 
                    dateRangeInput("Période",
                                   "Période:",
                                   start = "2001-01-01",
                                   end   = "2010-12-31"))
    ),
    
    fluidRow(column(8,
           selectInput("select", h3("Intitulé du texte"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      "Choice 3" = 3), selected = 1)),
    ),
    
    fluidRow(column(8,
               radioButtons("radio", h3("Thème"),
                            choices = list("Agriculture" = 1, "Culture, religion, médias" = 2,
                                           "Economie" = 3, "Energie" = 4, "Environnement" =5,
                                           "Finances publiques" = 6, "Formation et recherche" = 7, "Ordre public" = 8,
                                           "Politique de sécurité" = 9, "Politique étrangère" = 10, "Politique sociale" = 11,
                                           "Transports et infrastructures" = 12
                                           ),selected = 1)),
        
    ),
    
    fluidRow(column(8,
                    radioButtons("radio", h3("Type"),
                                   choices = list("Loi" = 1, "Initiative populaire" = 2,
                                                  "Contre-projet indirect" = 3, "Référendum" = 4),selected = 1)),
    ),
    
    mainPanel(
        textOutput("Selected_Var")),

)
# Define server logic ----
server <- function(input, output) {
    
    output$Selected_Var <- renderText({
        "Selection"
        })
}

# Run the app ----
shinyApp(ui = ui, server = server)

##A ajouter
#library(maps)

#map('', fill = TRUE, col = 1:10)

#install.packages("RSwissMaps")
#library(RSwissMaps)


#can.plot(bfs_id, data, year, add_geodata_path = ".", endofyear = FALSE,cantons = NULL, lakes = "all", boundaries = "c",boundaries_size = 0.2, boundaries_color = "white", extrema = "global",continuous = TRUE, color_continuous = c("#fee5d9", "#a50f15"),color_discrete = c("seq", "1"), color_na = "gray90", title = NULL,subtitle = NULL, caption = NULL, legend_title = NULL,legend_position = "bottom", save = FALSE, filename = "can_plot.png",dpi = 300, width = NA, heigth = NA, units = "cm")

#dt <- can.template(2016)
#for(i in 1:nrow(dt)){
#    dt$values[i] <- sample(c(300:700), 1)/1000}

#can.plot(dt$bfs_nr, dt$values, 2016)

