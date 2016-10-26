library(shiny)
library(ggplot2)
source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Coin toss experiment"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("tosses",
                     label = "Number of tosses:",
                     min = 1,
                     max = 10000,
                     value = 100),
         numericInput("seed",
                      "Random seed:",
                      value = 12345),
         h4("Number of heads:"),
         textOutput("heads")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  flips <- reactive({
    set.seed(input$seed)
    flip(tosses = input$tosses)
  })
  
   output$distPlot <- renderPlot({
     freqs <- cumsum(flips() == "H") / (1:input$tosses)
     dat = data.frame(
       tosses = 1:input$tosses,
       freqs = freqs
     )
     ggplot(data = dat, aes(x = tosses, y = freqs)) + 
       geom_path() + 
       ylim(0, 1) + 
       geom_abline(slope = 0, intercept = 0.5)
   })
   
   output$heads <- renderText({
     sum(flips() == 'H')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

