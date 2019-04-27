


library(shiny)
library(ggplot2)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$scatterPlot1 <- renderPlot({
        diamonds <- filter(diamonds, cut == input$cut) %>%
            filter(clarity == input$clarity)
        
        model <- lm(price ~ carat, data = diamonds)
        prediction <-
            predict(model, data.frame(carat = c(input$carats)))
        
        ggplot(data = diamonds, aes(carat, price)) +
            
            geom_point(color = "darkgray") + geom_smooth(method = "lm") +
            
            geom_vline(xintercept = input$carats) +
            
            geom_hline(yintercept = prediction) 
    })
    
})
