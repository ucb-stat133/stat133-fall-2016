# Lab 9, Stat 133 Fall 2016, Prof. Sanchez
# Shiny App version 4: Coin Tossing Experiment
# Inputs:
#   seed: random seed (for reproducibility purposes)
#   times: number of tosses
#   prob: probability of heads
#
# Outputs:
#   chance plot
#   data table with summary results

library(shiny)


# function that tosses a coin
toss <- function(x = c('heads', 'tails'), times = 1, 
                 prob = c(0.5, 0.5), seed = 123) {
  set.seed(seed)
  sample(x, size = times, replace = TRUE, prob = prob)
}


# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Coin Tossing Experiment"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      numericInput("seed",
                   label = "Random Seed",
                   value = 1234),
      sliderInput("times",
                  label = "Number of tosses:",
                  min = 1,
                  max = 1000,
                  value = 100),
      sliderInput("prob",
                  label = "Probability of heads:",
                  min = 0,
                  max = 1,
                  value = 0.5)
    ),
    
    # Show a plot of the relative frequencies
    mainPanel(
      plotOutput("chance_plot"),
      dataTableOutput("summary_table")
    )
  )
)


# Define server logic required to draw the plot
server <- function(input, output) {
  
  tosses <- reactive(
    toss(times = input$times, 
         prob = c(input$prob, 1 - input$prob),
         seed = input$seed)
  )
  proportions <- reactive(
    cumsum(tosses() == "heads") / (1:input$times)
  )

  # Fill in the spot we created for a plot
  output$chance_plot <- renderPlot({
    
    plot(1:input$times, proportions(), ylim = c(0, 1),
         col = '#627fe2', type = 'l', lwd = 3,
         xlab = 'Number of tosses',
         ylab = 'Proportion of heads',
         axes = FALSE, main = 'Percent Error')
    abline(h = 0.5, col = '#888888aa', lwd = 3)
    axis(side = 1)
    axis(side = 2, las = 1)
  })
  
  output$summary_table <- renderDataTable({
    data.frame(
      side = c('heads', 'tails'),
      prob = c(input$prob, 1 - input$prob),
      count = c(sum(tosses() == 'heads'), sum(tosses() == 'tails')),
      prop = c(sum(tosses() == 'heads') / input$times, 
                sum(tosses() == 'tails') / input$times)
    )
  })
}


# Run the application 
shinyApp(ui = ui, server = server)



