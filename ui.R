

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Diamond pricing with carat, cut and clarity"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput(
                "carats",
                label = "carats",
                min = 0.5,
                max = 2.0,
                value = 1.0,
                step = 0.1
            ),
            selectInput(
                "cut",
                label = "Cut",
                choices = list("Fair", "Good", "Very Good", "Premium", "Ideal"),
                selected = "Very Good"
            ),
            
            selectInput(
                "clarity",
                label = "Clarity",
                choices = list("I1", "SI2", "SI1",
                               "VS2", "VS1", "VVS2",
                               "VVS1", "IF"),
                selected = "VS1"
            ),
            submitButton("submit")
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput(outputId = "scatterPlot1"),
            h3("predicted price is: "),
            textOutput("predict_p"),
            h5("Note: Using this shiny app, after choosing the cut method, clarity property, carat and submitting, it will predict the according price.")
         )
    )
))
