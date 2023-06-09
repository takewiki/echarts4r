#' Wordcloud
#' 
#' Draw a wordcloud.
#' 
#' @inheritParams e_bar
#' @param word,freq Terms and their frequencies.
#' @param color Word color.
#' @param rm.x,rm.y Whether to remove x and y axis, defaults to \code{TRUE}.
#' 
#' @examples 
#' words <- function(n = 5000) {
#'   a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
#'   paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
#' }
#' 
#' tf <- data.frame(terms = words(100), 
#'   freq = rnorm(100, 55, 10)) %>% 
#'   dplyr::arrange(-freq)
#' 
#' tf %>% 
#'   e_color_range(freq, color) %>% 
#'   e_charts() %>% 
#'   e_cloud(terms, freq, color, shape = "circle", sizeRange = c(3, 15))
#' 
#' @seealso \href{official documentation}{https://github.com/ecomfe/echarts-wordcloud}
#' 
#' @rdname e_cloud
#' @export
e_cloud <- function(e, word, freq, color, rm.x = TRUE, rm.y = TRUE, ...){
  
  if(missing(e))
    stop("missing e", call. = FALSE)
  
  if(!missing(color))
    cl <- deparse(substitute(color))
  else 
    cl <- NULL
  
  e_cloud_(e, deparse(substitute(word)), deparse(substitute(freq)), cl, rm.x, rm.y, ...)
  
}

#' @rdname e_cloud
#' @export
e_cloud_ <- function(e, word, freq, color = NULL, rm.x = TRUE, rm.y = TRUE, ...){
  
  if(missing(e))
    stop("missing e", call. = FALSE)
  
  e <- .rm_axis(e, rm.x, "x")
  e <- .rm_axis(e, rm.y, "y")
  
  data <- .build_data(e, freq)
  data <- .add_bind(e, data, word)
  
  if(!is.null(color)){
    color <- .get_data(e, color)
    for(i in 1:length(data)){
      col <- list(
        normal = list(
          color = color[i]
        )
      )
      data[[i]]$textStyle <- col
    }
  }
  
  serie <- list(
    type = "wordCloud",
    data = data,
    ...
  )
  
  e$x$opts$series <- append(e$x$opts$series, list(serie))
  
  e
  
}

#' Liquid fill
#' 
#' Draw liquid fill.
#' 
#' @inheritParams e_bar
#' @param color Color to plot.
#' @param rm.x,rm.y Whether to remove x and y axis, defaults to \code{TRUE}.
#' 
#' @examples 
#' df <- data.frame(val = c(0.6, 0.5, 0.4))
#' 
#' df %>% 
#'   e_charts() %>% 
#'   e_liquid(val) %>% 
#'   e_theme("dark")
#' 
#' @seealso \href{official documentation}{https://github.com/ecomfe/echarts-liquidfill}
#' 
#' @rdname e_liquid
#' @export
e_liquid <- function(e, serie, color, rm.x = TRUE, rm.y = TRUE, ...){
  if(missing(e))
    stop("missing e", call. = FALSE)
  
  if(!missing(color))
    cl <- deparse(substitute(color))
  else
    cl <- NULL
  
  e_liquid_(e, deparse(substitute(serie)), cl, rm.x, rm.y, ...)
}

#' @rdname e_liquid
#' @export
e_liquid_ <- function(e, serie, color = NULL, rm.x = TRUE, rm.y = TRUE, ...){
  if(missing(e))
    stop("missing e", call. = FALSE)
  
  e <- .rm_axis(e, rm.x, "x")
  e <- .rm_axis(e, rm.y, "y")
  
  data <- .get_data(e, serie) %>% unlist() %>% unname()
  
  serie <- list(
    type = "liquidFill",
    data = data,
    ...
  )
  
  if(!is.null(color))
    serie$color <- .get_data(e, color) %>% 
    unlist() %>% 
    unname()
  
  e$x$opts$series <- append(e$x$opts$series, list(serie))
  
  e
}

#' Modularity
#' 
#' Graph modularity extension will do community detection and partian a graph's vertices in several subsets. 
#' Each subset will be assigned a different color.
#' 
#' @inheritParams e_bar
#' @param modularity Either set to \code{TRUE}, or a \code{list}.
#' 
#' @section Modularity:
#' \itemize{
#'   \item{\code{resolution} Resolution}
#'   \item{\code{sort} Whether to sort to comunities}
#' }
#' 
#' @examples 
#' nodes <- data.frame(
#'   name = paste0(LETTERS, 1:100),
#'   value = rnorm(100, 10, 2),
#'   stringsAsFactors = FALSE
#' )
#' 
#' edges <- data.frame(
#'   source = sample(nodes$name, 200, replace = TRUE),
#'   target = sample(nodes$name, 200, replace = TRUE),
#'   stringsAsFactors = FALSE
#' )
#' 
#' e_charts() %>% 
#'   e_graph() %>% 
#'   e_graph_nodes(nodes, name, value) %>% 
#'   e_graph_edges(edges, source, target) %>% 
#'   e_modularity(
#'     list(
#'       resolution = 5,
#'       sort = TRUE
#'     )
#'   )
#'   
#' @note Does not work in RStudio viewer, open in browser.
#' 
#' @seealso \href{https://github.com/ecomfe/echarts-graph-modularity}{Official documentation}
#' 
#' @export
e_modularity <- function(e, modularity = TRUE){
  
  clu <- list(
    modularity = modularity
  )
  
  e$x$opts$series[[length(e$x$opts$series)]]$modularity <- clu
  e
}