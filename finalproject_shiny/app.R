#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("the Coronavirus Project"),

    # Show a plot of the generated distribution
    mainPanel(
        # Use imageOutput to place the image on the page
        imageOutput("preImage")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    # Send a pre-rendered image, and don't delete the image after sending it
    output$preImage <- renderImage({
        # When input$n is 3, filename is ./images/image3.jpeg
        filename <- normalizePath(file.path('./images',
                                            paste('covid_cases_by_country', input$n, '.png', sep='')))
        
        # Return a list containing the filename and alt text
        list(src = filename)
        
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
