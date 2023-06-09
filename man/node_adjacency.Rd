% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proxies.R
\name{e_focus_adjacency}
\alias{e_focus_adjacency}
\alias{e_unfocus_adjacency}
\title{Node Adjacency}
\usage{
e_focus_adjacency(proxy, index, ...)

e_unfocus_adjacency(proxy, ...)
}
\arguments{
\item{proxy}{An echarts4r proxy as returned by \code{\link{echarts4rProxy}}.}

\item{index}{Index of node to focus on.}

\item{...}{Any other options, see 
\href{https://ecomfe.github.io/echarts-doc/public/en/api.html#action.graph}{official documentation} and details.}
}
\description{
Focus or unfocus on node adjacency.
}
\details{
Must pass \code{seriesId}, \code{seriesIndex}, or \code{seriesName}, generally \code{seriesIndex = 0} will work.
}
\examples{
value <- rnorm(10, 10, 2)

nodes <- data.frame(
  name = sample(LETTERS, 10),
  value = value,
  size = value,
  grp = rep(c("grp1", "grp2"), 5),
  stringsAsFactors = FALSE
)

edges <- data.frame(
  source = sample(nodes$name, 20, replace = TRUE),
  target = sample(nodes$name, 20, replace = TRUE),
  stringsAsFactors = FALSE
)

\dontrun{

  library(shiny)

  ui <- fluidPage(
    fluidRow(
      column(
        2, numericInput("index", "Node", value = 3, min = 1, max = 9)
      ),
      column(
        2, br(), actionButton("focus", "Focus")
      ),
      column(
        2, br(), actionButton("unfocus", "Unfocus")
      )
    ),
    fluidRow(
      column(12, echarts4rOutput("graph"))
    )
  )
  
  server <- function(input, output, session){
  
    output$graph <- renderEcharts4r({
      e_charts() \%>\% 
        e_graph() \%>\% 
        e_graph_nodes(nodes, name, value, size, grp) \%>\% 
        e_graph_edges(edges, source, target)
    })
    
    observeEvent(input$focus, {
    
      echarts4rProxy("graph") \%>\% 
        e_focus_adjacency(
          seriesIndex = 0,
          index = input$index
        )
    
    })
    
    observeEvent(input$unfocus, {
      
      echarts4rProxy("graph") \%>\% 
        e_unfocus_adjacency(seriesIndex = 0)
      
    })
  
  }
  
  shinyApp(ui, server)

}

}
