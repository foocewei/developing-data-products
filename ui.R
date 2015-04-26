library(shiny)

# Define UI for miles per gallon visualisation application
shinyUI(fluidPage(
  
    # Application title
    titlePanel("MTCARS Data Visualisation"),
    
    # Sidebar with controls to select the variable to plot against mpg,
    # and the fill colour of the boxplot
    sidebarLayout(
        sidebarPanel(
            selectInput("variable", "Variable:",
                        c("Cylinders" = "cyl",
                          "Transmission" = "am",
                          "Gears" = "gear",
                          "Carburetors" = "carb",
                          "Weight" = "wt",
                          "Displacement" = "disp",
                          "Horsepower" = "hp")
            ),
            selectInput("colour", "Plot Colour:",
                        c("White" = "white",
                          "Blue" = "blue",
                          "Green" = "green",
                          "Red" = "red",
                          "Yellow" = "yellow")
            ),
            br(),
            p("This application reads from the" , em("mtcars"), " dataset."),
            p("You can choose the variable to be plotted against miles per gallon and change the colour of the boxplot.")
        ),
        
        # Show the caption and plot of the requested variable against mpg
        mainPanel(
            h3(textOutput("caption")),
            plotOutput("mpgPlot")
        )
    )
))
