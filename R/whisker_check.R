#' whisker_check
#' 
#' Check a template for all variables
#' 
#' @param template character; mustache template
#' @param data named list or environment used for template construction
#'
#' \code{whisker_check} validates that all the values for a template are present.
#' 
#' @return 
#'   Returns \code{TRUE} if all template names are available. False otherwise.
#'
#' @seealso 
#'   \code{\link{whisker_names}} \cr
#'   
#' @examples
#' 
#'   tmpl <- "Hello {{Who}}"
#'   whisker_check( tmpl, list(Who = "World" ))     # TRUE
#'   whisker_check( tmpl, list(Person = "World" ))  # FALSE 
#' 
#' @export 

whisker_check <- function(template, data ) { 

  nms <- whisker_names(template)  
  all( nms %in% names(data) )
  
}
