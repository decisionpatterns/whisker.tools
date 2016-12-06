#' whisker_mapply - repeatedly render a template over multiple arguments 
#' 
#' Have a mixture of changing and unchanging template elements.
#' 
#' @param template character
#' @param data named list or environment with variables that will be used 
#' during rendering but do not change in each 
#' @param partials See \code{\link[whisker]{whisker.render}}
#' @param ... named list of object that get substituted 
#' 
#' \code{whisker_mapply} supports a mapply type interface over 
#' \code{whisker_render} that allows for vector of template renderings. 
#' 
#' The advantage of this approach are several-fold:  
#' - more reusablity of the template
#' - cleaner syntax
#' - no need to be changing out data
#' - less looping 
#' - template rendered as a vector
#' 
#' @return 
#'   character vector of rendered templates
#'   
#' @seealso 
#'   \code{\link{whisker_render}}
#'      
#' @examples   
#'   template <- 'type {{type}}: {{uppercase}},{{lowercase}}'
#'   whisker_mapply( template, list(type="alphabet"), lowercase=letters[1:3], uppercase=LETTERS[1:3] )
#'   
#'   # USED IN LOOP ... 
#'   #  template is pre-defined at top of code (above) and is not changes, 
#'   #   nor is it required to modify data. This is handled seemlessly. 
#'   \dontrun{
#'   # for( type in 1:2 ) { 
#'   #   print( whisker_mapply( template, list(type=type, uppercase="A"), lowercase=letters[1:3] ) )
#'   # }
#'   # }
#'      
#' @export   
 
whisker_mapply <- function( template, data = parent.frame(), partials = list(), ... ) { 
  
  data <- as.list(data)
  dots <- data.frame( list( ...) )

  ret <- character()
  for( row in 1:nrow(dots) ) {
    newdata <- c( as.list( dots[row, , drop=FALSE] ), data  )
    ret[[ length(ret)+1 ]] <- whisker_render( template=template, data=newdata, partials=partials ) 
  }  
  
  return(ret)
}
