% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map.R
\name{e_map}
\alias{e_map}
\alias{e_map_}
\alias{e_map_3d}
\alias{e_map_3d_}
\title{Choropleth}
\usage{
e_map(e, serie, map = "world", name = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)

e_map_(e, serie, map = "world", name = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)

e_map_3d(e, serie, map = "world", name = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)

e_map_3d_(e, serie, map = "world", name = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)
}
\arguments{
\item{e}{An \code{echarts4r} object as returned by \code{\link{e_charts}}.}

\item{serie}{Values to plot.}

\item{map}{Map type.}

\item{name}{name of the serie.}

\item{rm.x, rm.y}{Whether to remove x and y axis, defaults to \code{TRUE}.}

\item{...}{Any other option to pass, check See Also section.}
}
\description{
Draw maps.
}
\examples{
\dontrun{
choropleth <- data.frame(
  countries = c("France", "Brazil", "China", "Russia", "Canada", "India", "United States",
                "Argentina", "Australia"),
  values = round(runif(9, 10, 25))
)

choropleth \%>\% 
  e_charts(countries) \%>\% 
  e_map(values) \%>\% 
  e_visual_map(min = 10, max = 25)

choropleth \%>\% 
  e_charts(countries) \%>\% 
  e_map_3d(values, shading = "lambert") \%>\% 
  e_visual_map(min = 10, max = 30)
}

}
\seealso{
\code{\link{e_country_names}}, 
\href{Additional map arguments}{https://ecomfe.github.io/echarts-doc/public/en/option.html#series-map}, 
\href{Additional map 3D arguments}{http://echarts.baidu.com/option-gl.html#series-map3D}
}
