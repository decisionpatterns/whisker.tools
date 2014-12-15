#' Get template values from the call stack 
#' 
#' Introspect template and get values from their first appearance on the call 
#' stack.
#' 
#' @param template character; a whisker template
#' 
#' \code{whisker_get_all} searches the call sd
#' 
#' @return 
#'   list containing the names and values from the 
#'   
#' @seealso 
#'   \code{\link{whisker_names}} \cr
#'   \code{\link[base]{get}}
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


whisker_get_all <- function(template) { 

  nms <- whisker_names(template)

  li <- list() 
  
  for( nm in nms ) {
    value = try( get( nm ) )
 
    if( ! class(value) == 'try-error' ) 
      li[[nm]] <- get(nm, envir = parent.frame() ) else 
      warning( nm, " not found" )
  } 
  
  return(li)
}

# whisker_get_all <- function( template ) { 
# 
#   nms <- whisker_names( template )
#   
#   li <- list() 
#   
#   for( nm in nms ) {
#     envs <- find( nm )
# 
#     if( ! is.na(envs) )
#       value = try( get( nm, envir = as.environment( envs[1] ) ) )
#     
#     if( ! class(value) == 'try-error' ) li[[nm]] <- get( nm ) else 
#     warning( nm, "not found.")
#   }
#   
#   return(li)
#   
# }
