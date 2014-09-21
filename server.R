library(shiny)
data(ChickWeight)

fit <- lm(weight ~ Time + as.factor(Diet), data = ChickWeight)
shinyServer(
  function(input, output) {
    output$data_plot <- renderPlot(
      coplot(weight ~ Time | as.factor(Diet), data = ChickWeight, panel = panel.smooth, rows = 1)
    )
    
    output$model_res_plot <- renderPlot({
        plot(fitted(fit), resid(fit))
        abline(h=0)
      })
    
    output$data_table <- renderTable(head(ChickWeight, n = 10))
    
    output$model_summ <- renderPrint(summary(fit))
    
    output$o_weight <- renderPrint(predict(fit, 
                                           newdata = data.frame(Time = as.numeric(input$time), 
                                                                Diet = as.factor(input$diet))))
    
    output$o_diet <- renderPrint(input$diet)
    output$o_time <- renderPrint(as.numeric(input$time))
                                    
  }
  
)