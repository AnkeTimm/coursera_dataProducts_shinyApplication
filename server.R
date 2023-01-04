#
# This is the server logic of a Shiny web application. You can run the

function(input, output, session) {
    
    # Combine the selected variables into a new data frame
    selectedData <- reactive({
        mtcars[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        palette(c("#D1382D", "#4A7CB3", "#67AD57", "#8E529F",
                  "#EE8632", "#FEFC60", "#9C5A33", "#E787BD", "#999999"))
        
        par(mar = c(5, 4, 0, 2))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 19, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
}