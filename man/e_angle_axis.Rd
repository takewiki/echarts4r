% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid.R
\name{e_angle_axis}
\alias{e_angle_axis}
\title{Angle axis}
\usage{
e_angle_axis(e, show = TRUE, ...)
}
\arguments{
\item{e}{An \code{echarts4r} object as returned by \code{\link{e_charts}}.}

\item{show}{Whether to display the axis.}

\item{...}{Any other option to pass, check See Also section.}
}
\description{
Customise angle axis.
}
\examples{
df <- data.frame(x = 1:100, y = seq(1, 200, by = 2))

df \%>\% 
  e_charts(x) \%>\% 
  e_polar(FALSE) \%>\% 
  e_angle_axis(FALSE) \%>\% 
  e_radius_axis(FALSE) \%>\% 
  e_line(y, coord.system = "polar", smooth = TRUE) \%>\% 
  e_legend(show = FALSE)

}
\seealso{
\href{https://ecomfe.github.io/echarts-doc/public/en/option.html#angleAxis}{Additional arguments}
}
