library(shiny)
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$plot <- renderPlot({
    data <- na.omit(movies)
    data <- data[which(data$year > 1969 & data$votes > 500 & data$budget > 0),]

    data <- data[which(data$year>=input$year[1] & data$year<=input$year[2]),]
    if (input$genre != "All"){
      data <- data[data[[input$genre]] == 1,]
    }
    ggplot(data, aes(x=budget, y=rating)) + geom_point(shape=1) + 
      geom_smooth(method = "loess", se=FALSE)
  })
})
