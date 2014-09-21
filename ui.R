library(shiny)
shinyUI(
  fluidPage(
    titlePanel("Chicken weight prediction"),
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "diet",
                    label = "Diet:",
                    choices = c(1, 2, 3, 4),
                    selected = 1),
        sliderInput(inputId = "time",
                    label = "Day:",
                    min = 1, max = 21, value = 1, step = 1),
        br(),
        p("Switch to Prediction tab to see the result")
      ),
      
      mainPanel(   
        tabsetPanel(type = "tabs",
                    tabPanel("About",
                             p("Application uses the ChickWeight data set to fit regression model. You as user can use application to predict chicken weight."),
                             p("You can select the Diet and use the Day slider bar on the left hand side to input parameters."), 
                             p("Based on the fitted regression model, the app will predict chicken weight, given the Diet and Time."),
                             p("Please switch to Prediction tab to see the result")),
                    tabPanel("Data set",
                             h3("Some data set exploration:"),
                             plotOutput("data_plot", height = "300px"),
                             h4("First 10 rows of dataset:"),
                             tableOutput("data_table")),
                    tabPanel("Model", 
                             h3("Fitted regression model"),
                            verbatimTextOutput("model_summ"),
                            plotOutput("model_res_plot")),
                          
                    tabPanel("Prediction",
                             h3("Predicted chicken weight:"),
                             verbatimTextOutput("o_weight"),                             
                             h4("Given the Diet is:"),
                             verbatimTextOutput("o_diet"),
                             h4("and Time is:"),
                             verbatimTextOutput("o_time")
                             )
        )
      )
    )
  )
)