% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add.R, R/add_.R
\name{e_scatter}
\alias{e_scatter}
\alias{e_effect_scatter}
\alias{e_scatter_}
\alias{e_effect_scatter_}
\title{Scatter}
\usage{
e_scatter(e, serie, size, bind, symbol.size = 10, scale = "* 1",
  name = NULL, coord.system = "cartesian2d", legend = TRUE,
  y.index = 0, x.index = 0, rm.x = TRUE, rm.y = TRUE, ...)

e_effect_scatter(e, serie, size, bind, symbol.size = 10, scale = "* 1",
  name = NULL, coord.system = "cartesian2d", legend = TRUE,
  y.index = 0, x.index = 0, rm.x = TRUE, rm.y = TRUE, ...)

e_scatter_(e, serie, size = NULL, bind = NULL, symbol.size = 10,
  scale = "* 1", name = NULL, coord.system = "cartesian2d",
  legend = TRUE, y.index = 0, x.index = 0, rm.x = TRUE,
  rm.y = TRUE, ...)

e_effect_scatter_(e, serie, size = NULL, bind = NULL,
  symbol.size = 10, scale = "* 1", name = NULL,
  coord.system = "cartesian2d", legend = TRUE, y.index = 0,
  x.index = 0, rm.x = TRUE, rm.y = TRUE, ...)
}
\arguments{
\item{e}{An \code{echarts4r} object as returned by \code{\link{e_charts}}.}

\item{serie}{Column name of serie to plot.}

\item{size}{Column name containing size of points.}

\item{bind}{Binding between datasets, namely for use of \code{\link{e_brush}}.}

\item{symbol.size}{Size of points, either an integer or a vector of length 2, 
only used if \code{size} is \code{NULL} or missing.}

\item{scale}{Scale for \code{size}, defaults to \code{* 1} which multiplies the size
by \code{1} (equivalent to no multiplier).}

\item{name}{name of the serie.}

\item{coord.system}{Coordinate system to plot against, see examples.}

\item{legend}{Whether to add serie to legend.}

\item{y.index}{Indexes of x and y axis.}

\item{x.index}{Indexes of x and y axis.}

\item{rm.x, rm.y}{Whether to remove x and y axis, only applies if \code{coord.system} is not 
set to \code{cartesian2d}.}

\item{...}{Any other option to pass, check See Also section.}
}
\description{
Add scatter serie.
}
\examples{
USArrests \%>\% 
  e_charts(Assault) \%>\% 
  e_scatter(Murder, Rape) \%>\% 
  e_effect_scatter(Rape, Murder, y.index = 1) \%>\% 
  e_grid(index = c(0, 1)) \%>\% 
  e_tooltip()

iris \%>\% 
  e_charts_("Sepal.Length") \%>\% 
  e_scatter_(
    "Sepal.Width", 
    symbol.size = c(8, 2), 
    symbol = "rect"
  ) \%>\% 
  e_x_axis(min = 4)

quakes \%>\% 
  e_charts(long) \%>\% 
  e_geo(
    roam = TRUE,
    boundingCoords = list(
      c(185, - 10),
      c(165, -40)
    )
  ) \%>\% 
  e_scatter(lat, mag, coord.system = "geo") \%>\% 
  e_visual_map(min = 4, max = 6.5)
  
}
\seealso{
\href{https://ecomfe.github.io/echarts-doc/public/en/option.html#series-scatter}{Additional arguments scatter},
 \href{https://ecomfe.github.io/echarts-doc/public/en/option.html#series-effectScatter}{Additional arguments for effect scatter}
}
