# Title: Chevalier De Mere's game 1
# Description: this app simulates playing De Mere's game 1
#              getting at least one six in 4 rolls of a die
# Author: Gaston Sanchez


library(shiny)
source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("De Mere's Game 1"),
   
   # Sidebar with a slider input for number of games 
   sidebarLayout(
      sidebarPanel(
         sliderInput("games",
                     "Number of games:",
                     min = 1,
                     max = 1000,
                     value = 10),
         sliderInput("wager",
                     "Wager (money you bet per game)",
                     min = 1,
                     max = 1000,
                     value = 1),
         numericInput("seed",
                      "Random Seed",
                      value = 1234),
         hr(),
         helpText("Wins"),
         verbatimTextOutput("wins"),
         helpText("Losses"),
         verbatimTextOutput("losses"),
         helpText("Net gain"),
         verbatimTextOutput("gain")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("dist_plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  rolls <- reactive({
    set.seed(input$seed)
    roll(die = 1:6, times = 4 * input$games)})
  outputs <- reactive(matrix(rolls(), nrow = input$games, ncol = 4, 
                             byrow = TRUE))
  sixes <- reactive(apply(outputs(), 1, num_sixes))
  losses <- reactive(sum(sixes() == 0))
  wins <- reactive(input$games - losses())
  gain <- reactive(input$wager * (wins() - losses()))
  
  output$dist_plot <- renderPlot({
     # draw the barchart with the distribution for number of sixes
     barplot(round(table(sixes()) / input$games, 2),
             las = 1, col = "gray70", border = NA,
             xlab = "Number of sixes",
             ylab = "relative frequency",
             main = "Distribution of sixes")
   })
  
  output$wins <- renderText({
    wins()
  })
  output$losses <- renderText({
    losses()
  })
  output$gain <- renderText({
    gain()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

