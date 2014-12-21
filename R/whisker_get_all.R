#' Get template values from the call stack 
#' 
#' Introspect template and get values from their first appearance on the call 
#' stack.
#' 
#' @param template character; a whisker template
#' 
#' @param ... additional arguments passed to \code{\link[base]{get}}
#' 
#' \code{whisker_get_all} searches the call sd
#' 
#' @return 
#'   list containing the names and values from the 
#'   
#' @seealso 
#'   \code{\link[base]{get}} \cr
#'   \code{\link{whisker_names}} \cr
#'   
#' @examples 
#' 
#'   a=1; z=26 
#'   
#'   tmpl = "A is rank {{a}}; z is rank {{z}}"
#'   whisker_get_all( tmpl )
#'  
#'   # In function:              
#'   f <- function( template ) whisker_get_all( template )      
#'   f(tmpl) 
#'   
#' @export 


whisker_get_all <- function(template, ...) { 
# browser()
  nms <- whisker_names(template)

  li <- list() 
  
  for( nm in nms ) {
    li[[nm]] <-
      
      tryCatch( get(nm)
        , error = function() 
            tryCatch( 
                get(nm, ...)
              , error = function() warning( "whisker_get_all: ", nm, " not found", immediate. = TRUE, call. = FALSE ) 
            )
      )
  } 
  
  return(li)
  
}
