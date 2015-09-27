#The Exponential distribution in R and compare it with the Central Limit Theorem
library(shiny)

shinyUI(fluidPage(
  titlePanel("The Exponential distribution in R and compare it with the Central Limit Theorem(CLT) "),
  sidebarLayout(
    sidebarPanel(
      helpText(h4(strong("Choose parameters for Demotrations"))),
      selectInput("lambda", 
                  label = "Lambda size",
                  choices = c(0.1, 0.2, 0.3, 0.4, 0.5, 1),
                  selected = 0.2),

      sliderInput("sam", label = "Sampling number:", min = 10, max = 80, step = 5, value = 20),
      sliderInput("sim", label = "Number of Simulations:", min = 100, max = 10000, step = 100, value = 100),
      radioButtons("color", "Mean Color:", choices = c("Red" ="red", "Yellow" = "yellow"), selected = "red"),
      hr(), 
      
      p(strong("Legends ")),
      span("___", style = "color:orange"), 
      span("The theory distribution of averages-CLT"),
      br(),
      span("___", style = "color:blue"),
      span("The exponential distribution of averages"),
            
      hr(),
      p(strong("Created by Dinh Huy Hoang"),
        br(),
        a("Github", 
          href = "https://github.com/hhdinhgithub/")),
      
      p(strong("Source Code:"),
        a("Github repository", 
          href = "https://github.com/hhdinhgithub/shinyapps/"))

    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel(strong("Demostration"),
        br(),
        h5(strong("You have selected")),
        textOutput("text1"),
        textOutput("text2"),
        textOutput("text3"),
        br(),
        plotOutput("plot")
        ), 
        tabPanel(strong("Documentation"),
                 # include content of documentation from document.html file.
                 includeHTML("document.html")
        )
      )
    )
  )
))