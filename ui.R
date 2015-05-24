library(shiny)
x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
dataset <- data.frame(x,y,z)
shinyUI(fluidPage(
                  titlePanel("k-means cluster detector"),
               fluidRow(column(6, h3("Description:", style = "color:grey"),
                        p("kmeans is a method to partition n observations into k clusters where each observation belongs to the cluster with the nearest mean"),
                        p(withMathJax("$$\\underset{s}{argmin} \\sum^{k}_{i=1} \\sum_{x \\in S_i} ||x-\\mu_i||^2$$")),
                        p("This is a sample application to demonstrate k-means method, applied on 2D randomly generated data"),
                        p("Choose the data and number of clusters from the bars and find the center of clustering in your data.")),
                        column(4, selectInput('xcol', 'X Variable', names(dataset))),
                        column(4, selectInput('ycol', 'Y Variable', names(dataset),
                                              selected=names(dataset)[[2]])),
                        column(4, numericInput('clusters', 'Cluster count', 3,
                                               min = 1, max = 9))
               ),
               fluidRow(
                       plotOutput('kmeans', height = "400px")  
               )
))