# Title: Coin Tossing
# Description: this app simulates tossing a coin a given number of times
# Author: Gaston Sanchez

library(shiny)
library(ggplot2)

# Define UI for application that draws relative frequencies in a series
# of tosses
ui <- fluidPage(
   
   # Application title
   titlePanel("Coin Tossing"),
   
   # Sidebar with a slider input for number of tosses 
   sidebarLayout(
      sidebarPanel(
         sliderInput("times",
                     "Number of tosses:",
                     min = 1,
                     max = 5000,
                     value = 100),
         sliderInput("prob",
                    "Probability of heads",
                    min = 0, 
                    max = 1,
                    value = 0.5),
         numericInput("seed",
                      "Random seed",
                      value = 12345)
      ),
      
      # Show a plot of the generated series of frequencies
      mainPanel(
         plotOutput("freq_plot")
      )
   )
)

# Define server logic required to draw trend of frequencies
server <- function(input, output) {
   
   output$freq_plot <- renderPlot({
      # generate bins based on input$bins from ui.R
     set.seed(input$seed)
     tosses <- sample(c("heads", "tails"), 
                      size = input$times,
                      replace = TRUE,
                      prob = c(input$prob, 1 - input$prob))
     # data frame
     dat <- data.frame(
       tosses = 1:input$times,
       num_heads = cumsum(tosses == 'heads'),
       prop_heads = cumsum(tosses == 'heads') / (1:input$times),
       num_tails = cumsum(tosses == 'tails'),
       prop_tails = cumsum(tosses == 'tails') / (1:input$times)
     )
     
     ggplot(data = dat, aes(x = tosses, y = prop_heads)) +
       geom_abline(intercept = 0.5, slope = 0, col = "gray70", size = 0.8) +
       geom_path(size = 1, col = "#9783d4") + 
       ylim(0, 1)

   })
}

# Run the application 
shinyApp(ui = ui, server = server)

