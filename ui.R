library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Movie Ratings versus Budgets"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        sliderInput("year", "Range years: (1970-2005)",
                    min = 1970, max = 2005, value = c(1999,2005)),
        selectInput("genre", "Genre",
                    c("All", "Action", "Animation", "Comedy", "Documentary", "Drama", "Romance", "Short")
        ),
        
        hr(),
        helpText("The range years slider can be set to select any range of 
                 years between 1970 to 2005.  This will limit the results to 
                 movies released in that period.
                 
                 The Genre may be selected, or 'All' will include movies of
                 all genres ... all movies."),
        hr(),
        helpText("The resulting graph on the right shows the movie budget on the 
                 x-axis and the average IMDB.com rating on the y-axis.  A regression line 
                 is added.  The plot is designed to show how the budget of a movie impacts
                 the rating assigned by viewers.")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("plot")  
      )
      
    )
  )
)