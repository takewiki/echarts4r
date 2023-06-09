% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add.R, R/add_.R
\name{e_lines_3d}
\alias{e_lines_3d}
\alias{e_line_3d}
\alias{e_lines_3d_}
\alias{e_line_3d_}
\title{Lines 3D}
\usage{
e_lines_3d(e, source.lon, source.lat, target.lon, target.lat,
  name = NULL, coord.system = "globe", rm.x = TRUE, rm.y = TRUE,
  ...)

e_line_3d(e, y, z, name = NULL, coord.system = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)

e_lines_3d_(e, source.lon, source.lat, target.lon, target.lat,
  name = NULL, coord.system = "globe", rm.x = TRUE, rm.y = TRUE,
  ...)

e_line_3d_(e, y, z, name = NULL, coord.system = NULL, rm.x = TRUE,
  rm.y = TRUE, ...)
}
\arguments{
\item{e}{An \code{echarts4r} object as returned by \code{\link{e_charts}}.}

\item{source.lon, source.lat, target.lon, target.lat}{coordinates.}

\item{name}{name of the serie.}

\item{coord.system}{Coordinate system to use, such as \code{cartesian3D}, or \code{globe}.}

\item{rm.x, rm.y}{Whether to remove x and y axis, defaults to \code{TRUE}.}

\item{...}{Any other option to pass, check See Also section.}

\item{y, z}{Coordinates of lines.}
}
\description{
Add 3D lines.
}
\examples{
# get data
flights <- read.csv(
  paste0("https://raw.githubusercontent.com/plotly/datasets/",
         "master/2011_february_aa_flight_paths.csv")
)

# Lines 3D
# Globe
flights \%>\% 
  e_charts() \%>\% 
  e_globe(
    base.texture = e_map_texture(),
    height.texture = e_map_texture(),
    environment = e_stars_texture(),
    displacementScale = 0.05
  ) \%>\% 
  e_lines_3d(
    start_lon, 
    start_lat, 
    end_lon, 
    end_lat,
    name = "flights",
    effect = list(show = TRUE)
  ) \%>\% 
  e_legend(FALSE)

# Geo 3D
flights \%>\% 
  e_charts() \%>\% 
  e_geo_3d() \%>\% 
  e_lines_3d(
    start_lon, 
    start_lat, 
    end_lon, 
    end_lat,
    coord.system = "geo3D"
  )
 
# line 3D 
df <- data.frame(
  x = 1:100,
  y = runif(100, 10, 25),
  z = rnorm(100, 100, 50)
)

df \%>\% 
  e_charts(x) \%>\% 
  e_line_3d(y, z) \%>\% 
  e_visual_map() \%>\% 
  e_title("nonsense")

}
\seealso{
\href{http://echarts.baidu.com/option-gl.html#series-lines3D}{Additional arguments for lines 3D},
 \href{http://echarts.baidu.com/option-gl.html#series-line3D}{Additional arguments for line 3D}
}
