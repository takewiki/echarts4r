% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proxies.R
\name{e_highlight_p}
\alias{e_highlight_p}
\alias{e_downplay_p}
\title{Highlight Proxy}
\usage{
e_highlight_p(proxy, series.index = NULL, series.name = NULL)

e_downplay_p(proxy, series.index = NULL, series.name = NULL)
}
\arguments{
\item{proxy}{An echarts4r proxy as returned by \code{\link{echarts4rProxy}}.}

\item{series.index}{Series index, can be a vector.}

\item{series.name}{Series Name, can be vector.}
}
\description{
Proxies to highlight and downplay series.
}
\examples{
\dontrun{

  library(shiny)

 ui <- fluidPage(
   fluidRow(
     column(
       3,
       actionButton("highlightmpg", "Highlight MPG")
     ),
     column(
       3,
       actionButton("highlighthp", "Highlight HP")
     ),
     column(
       3,
       actionButton("downplaympg", "Downplay MPG")
     ),
     column(
       3,
       actionButton("downplayhp", "Downplay HP")
     )
   ),
   echarts4rOutput("plot")
 ) 
 
 server <- function(input, output, session){
   output$plot <- renderEcharts4r({
     mtcars \%>\% 
       e_charts(mpg) \%>\% 
       e_line(disp) \%>\% 
       e_line(hp, name = "HP") # explicitly pass name
   })
   
   # highlight
   
   observeEvent(input$highlightmpg, {
     echarts4rProxy("plot") \%>\% 
       e_highlight_p(series.index = 0) # using index
   })
   
   observeEvent(input$highlighthp, {
     echarts4rProxy("plot") \%>\% 
       e_highlight_p(series.name = "HP") # using name
   })
   
   # downplay
   
   observeEvent(input$downplaympg, {
     echarts4rProxy("plot") \%>\% 
       e_downplay_p(series.name = "disp")
   })
   
   observeEvent(input$downplayhp, {
     echarts4rProxy("plot") \%>\% 
       e_downplay_p(series.index = 1)
   })
 }
 
 shinyApp(ui, server)

}

}
