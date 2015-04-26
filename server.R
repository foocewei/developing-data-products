library(shiny)
library(datasets)

# Set "am" field to show factor labels instead of 0 and 1.
data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

    # Compute the formula text in a reactive expression since it is
    # shared by the output$caption and output$mpgPlot functions
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })

    # Return the formula text for printing as a caption
    output$caption <- renderText({
        formulaText()
    })

    # Generate a boxplot of the selected variable against mpg
    # using the selected input colour
    output$mpgPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = mtcars, 
                col = input$colour)
    })
})
