#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(googleVis)
library(shinythemes)

#shinythemes::themeSelector()
#theme = shinytheme("readable")


# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        theme = shinytheme("simplex"),
    
        tags$head(
            tags$style(
                HTML(".navbar .navbar-nav {float: right}"),
                HTML('.selectize-input {white-space: nowrap}
                    #choice+ div>.selectize-dropdown{width: 660px !important}
                    #choices+ div>.selectize-dropdown{width: 300px !important}'),
                type = "text/css", 
                "body {padding-top: 70px;}"
            )),
    
        
        
    navbarPage(
        title = "FEMALE ARTIST EXPLORER",
        id = "moma",
        position = "fixed-top",
        tabPanel("MOMA", icon = icon('cat'),
                plotOutput("by_country_density") 
                 
            ),
    #tabPanel("EXPLORE",icon = icon("poll"),
        tabPanel("ARSTY",
        selectizeInput("artist_name",
                label = "Choose an Artist you like",
                choices = artsy_df$name),
       
    
                
                useShinyjs(), 
                uiOutput("main_artist_thumb"),
                dataTableOutput("mytable"), 
                uiOutput("similar_images")
                
        )
    )
    )
    
                

    
    
    )


    
    

