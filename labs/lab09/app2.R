# Lab 9, Stat 133 Fall 2016, Prof. Sanchez
# Shiny App version 2: Coin Tossing Experiment
# Inputs:
#   times: number of tosses
#   prob: probability of heads
#
# Outputs:
#   chance plot

library(shiny)


# function that tosses a coin
toss <- function(x = c('heads', 'tails'), times = 1, prob = c(0.5, 0.5)) {
  sample(x, size = times, replace = TRUE, prob = prob)
}


# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Coin Tossing Experiment"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
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
      plotOutput("chance_plot")
    )
  )
)


# Define server logic required to draw the plot
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$chance_plot <- renderPlot({
    tosses <- toss(times = input$times, 
                   prob = c(input$prob, 1 - input$prob))
    proportions <- cumsum(tosses == "heads") / (1:input$times)
    
    plot(1:input$times, proportions, ylim = c(0, 1),
         col = '#627fe2', type = 'l', lwd = 3,
         xlab = 'Number of tosses',
         ylab = 'Proportion of heads',
         axes = FALSE, main = 'Percent Error')
    abline(h = 0.5, col = '#888888aa', lwd = 3)
    axis(side = 1)
    axis(side = 2, las = 1)
    
  })
}


# Run the application 
shinyApp(ui = ui, server = server)



