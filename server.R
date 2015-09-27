shinyServer(function(input, output) {
})

library(shiny)
library(ggplot2)

distribution <- function(par1, par2, par3, par4)
{
  set.seed(100)     # For reproducible 
  lambda <- as.numeric(par1)      # Set lambda  
  sam <- par2                     # Sampling Size 
  sim <- par3                     # Number of simulations 
  means <- NULL                   # set msn to null to avoid duplication data
  co <- par4
  
  for (i in 1 : sim) means <- c(means, mean(rexp(sam,lambda))) 
  sample_mean <- data.frame(means) 
  
  th_mean <- 1/lambda 
  average <- mean(sample_mean$means) 
  th_var  <- ((1/lambda)^2)/sam                     # Theoretical variance 
  var_mean<- var(sample_mean$means)                 # variance of the means 
  
  plot <- ggplot(sample_mean, aes(x = means)) + 
    geom_histogram(alpha = .20, binwidth=0.2,colour = "black", aes(y = ..density..)) + 
    geom_vline(xintercept=average, size = 1.5, color = co) +
    stat_function(geom = "line", fun = dnorm, arg = list(mean = average, sd = sqrt(th_var)), size = 1, colour = "orange", fill = NA) +
    stat_function(geom = "line", fun = dnorm, arg = list(mean = th_mean, sd = sqrt(var_mean)), size = 1, colour = "blue", fill = NA) +
    labs(x="mean", y="Density" , 
         title="Distribution of Sampling Means")
  print(plot) 
}

shinyServer(function(input, output) {
  
  output$text1 <- renderText({ 
    paste("Lambda:", input$lambda)
  })
  
  output$text2 <- renderText({ 
    paste("Sampling size:", input$sam[])
  })
  
  output$text3 <- renderText({ 
    paste("Number of simulations:",input$sim[])
  })
  
  output$plot <- renderPlot({
    
    distribution(input$lambda, input$sam, input$sim, input$color)
    
  })
  
})