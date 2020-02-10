#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("helper.R")


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    ## MOMA tab
    output$by_country_density <- renderPlot({
        
        moma_df %>% filter(., gender=="female") %>% 
            ggplot(., aes(x = aqui_date, color = as.factor(is_american))) +
            geom_density() + 
            ggtitle("Acquisition of Pieces by Female Artists Overtime MOMA") +
            labs(x = "Acquisition Date", y = "Density") +
            theme(legend.title = element_blank()) +
            scale_colour_manual(values = c("#6A0AC1", "#107dac")) 
        
    })
    
    output$by_category <- renderPlot({
        moma_df %>% ggplot(aes(x=class_)) + geom_bar(aes(fill=gender)) + 
            theme(axis.text.x = element_text(angle = 90)) + 
            scale_x_discrete(labels=c("Mies van der Rohe Archive" = 'Rohe Archive')) +
            labs(x = "MoMa Classification", y = "Count")
    })
    
    ## Artsy Tab
    
    data_spread <- reactive({
         get_spread_data(input$artist_name) 
    })
    
    
    artist_profile <- reactive({
        artsy_df %>%
            filter(., name ==input$artist_name)
    })

    output$main_artist_thumb<- renderUI({
        thumb <- artist_profile() %>%
            select(thumbnail)
        
        imgurl2 <- as.character(thumb[[1]])
        div(id = "main_artist_thumb",
            tags$img(src = imgurl2)
        )
    })
    
    
    
    
    # this outputs a table of one arist will all thier similar 
    # artits/links/thumnails as a datatable
    output$mytable <- renderDataTable({
        
        data_spread() %>% select(., Similar.Artists = similar_names)
        },
    escape = FALSE)
    
    output$similar_images <- renderUI({
        
        # showing first 2 thumbnails 
        list(img(src = data_spread()$thumbnails[[1]]),
        img(src = data_spread()$thumbnails[[2]]))
        })
    
    updateSelectizeInput(session, 'artist_name', choices = artsy_df$name, server = TRUE)
    
    
    
    
    
    

})
