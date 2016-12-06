#' whisker_render
#' 
#' An alias for whisker.render 
#'  
#' @param template	character with template text
#' @param data named list or environment with variables that will be used during rendering
#' @param partials	named list with partial templates, will be used during template construction
#' @param debug	Used for debugging purposes, likely to disappear  
#'  
#' @seealso 
#'   \code{\link[whisker]{whisker.render}}
#' 
#' @author 
#'   Edwin de Jonge, \url{https://github.com/edwindj/whisker}
#'
#' @export

whisker_render <-  whisker::whisker.render
