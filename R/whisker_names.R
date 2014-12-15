#' whisker_names 
#' 
#'  Extract varaibles names from a whisker template
#'  
#'  @param template character of template text
#'  
#'  Provides a stringr type function for extracting the names for the 
#'  substituted variable. This is useful if you want to do some checking or 
#'  other manipulation of the template prior to rendering.
#'  
#'  @return
#'    chracter vector of names found in the template
#'
#'  @seealso 
#'    \code{\link[whisker]{whisker.render}}
#'    \code{\link[stringr]{str_extract_all}} on which this function relies  
#'    
#'  @examples
#'    template <- "Dear {{name}}, I have not loved you since {{date}}"
#'    
#'    whisker_names(template)
#'    
#'   
#' @export   
#' @import stringr

whisker_names <- function(template) {
  
  variables <- 
    stringr::str_extract_all( template, pattern=perl( '{{(.+?)}}' ) )
  
  variables <- lapply( variables, str_replace_all, pattern=perl( '[{}]'), replacement='')
  
  unlist(variables)
}
  