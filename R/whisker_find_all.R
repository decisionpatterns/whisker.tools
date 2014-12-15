#' Introspect template and find values from the call stack.
#' 
#' Create a list from names in the template that can be passed
#' 
#' @param template character; a whisker template
#' 
#' @return 
#'   list containing the
#'   
#' @seealso 
#'   \code{\link{whisker_extract_all}}
#' @examples 
#' 
#'   a=1; z=26 
#'   
#'   tmpl = "A is rank {{a}}; z is rank {{z}}"
#'   whisker_find_all( tmpl )
#'         
#' @export 


whisker_find_all <- function( template ) { 

  nms <- whisker_extract_all( template )
  
  li <- list() 
  for( nm in nms ) {
    value = try( get(nm) )
    if( ! class(value) == 'try-error' ) li[[nm]] <- get( nm ) else 
    warning( nm, "not found.")
  }
  
  return(li)
  
}

