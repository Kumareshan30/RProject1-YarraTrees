library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)

trees_data <- read.csv('./yarra-trees-PE2.csv')

# Define UI
ui <- fixedPage(
  titlePanel(h3("YARRA TREES", align = "center")),
  hr(),
  fixedRow(column(12, h5("The map below shows the locations of Trees 
                        across Yarra. It also gives the basic information
                        about each tree when clicked on and also supports 
                        an addditonal functionality of filtering the trees
                        based on their DBH value and Height.")), align = "center"),
  fixedRow(
    column(8, leafletOutput("yarratreemap")),
    column(4, (fixedRow(sliderInput("dbh", "DBH:",
                                            min = 0, max = 200,
                                            value = c(0,200)), align = "center")),
              br(),
              br(),
              fixedRow(sliderInput("height", "Height:",
                                            min = 0, max = 35,
                                            value = c(0,35)), align = "center")
    )
  ),
  hr(),
  fixedRow(
    column(4, fixedRow(titlePanel("VISUALIZATION FOR DBH AND HEIGHT"), align = "center"),
              br(),
              fixedRow(
              h4("VISUALIZATION 1"),
              p("The First Graph to the left shows us the relation between dbh and height of all the trees,
                         grouped by their genus types."),
              br(),
              h4("VISUALIZATION 2"),
              p("The Second Graph to the left shows us the frequency distribution of the trees. Its is a boxplot
                          showing the average, quartile and mean height of each Genus type."))),
    column(4, plotOutput("scatter")),
    column(4, plotOutput("histogram"))
  )
)


# Define server
server <- function(input, output) {
  slider_data <- reactive({
    trees_data %>%
      filter(dbh >= input$dbh[1] & dbh <= input$dbh[2] &
               height >= input$height[1] & height <= input$height[2])
  })
  
  output$yarratreemap <- renderLeaflet({
    
    palette <- colorFactor(palette = "Greens", domain = slider_data()$age)
    leaflet(data = slider_data()) %>%
      addTiles() %>%
      addCircleMarkers(
        lng = ~longitude,
        lat = ~latitude,
        color = ~palette(age),
        popup =  ~paste(
          "Tree Species: ", slider_data()$species,
          "<br>Genus: ", slider_data()$genus,
          "<br>Age: ", slider_data()$age, 
          "<br>Height: ", slider_data()$height,
          "<br>DBH: ", slider_data()$dbh),
        radius = (~dbh*0.1)) %>%
      addLegend("bottomright", pal = palette, values = slider_data()$age,
                title = "Age of Trees",
                opacity = 1
      )
  })
  output$scatter <- renderPlot({
    ggplot(trees_data, aes(x = dbh, y = height, color=genus)) +  
      geom_point() +  
      theme(legend.position="bottom", legend.justification=c(0,0)) +
      labs(x = "DBH", y = "Height", title = "DBH vs. Height")
  })
  
  output$histogram <- renderPlot({
    ggplot(trees_data, aes(x = height, y=genus)) +
      geom_boxplot() +
      labs(x = "Height", y = "Genus", title = "Height Distribution for each Genus")
  })
}

# Run the app
shinyApp(ui, server)