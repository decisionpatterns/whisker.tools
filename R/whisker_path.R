#' whisker_path
#' 
#' Combines \code{\link[base]{file.path}} except arguments are run through 
#' \code{\link{whisker_render}} first,
#' 
#' @param ... character; defining a path
#' @param data named list or environment with variables that will be used during
#'        rendering 
#' @param fsep character; the path separator to use
#' 
#' @details
#'    
#'   \code{whisker.path} is an alias for \code{whisker_path.}
#' 
#' @note 
#'   Whisker variables cannot contain '.' by specification, therefore the 
#'   template cannot use names with '.'
#'   
#' @seealso
#'   \code{\link[base]{file.path}} \cr
#'   \code{\link{whisker_render}}
#'   
#' @examples 
#'   dir <- "~/tmp"
#'   file_name <- "myfile"
#'   whisker_path( "{{dir}}", "{{file_name}}.txt" )
#'   
#' @export
#' @import whisker

whisker_path <- function( ..., data=parent.frame(), fsep=.Platform$file.sep ) { 

  template <- Reduce( 
    function(x,y) file.path( x,y, fsep=fsep), list(...) 
  )
  
  return( whisker_render( template, data=data ) )
  
}

#' @export whisker.path 
#' @rdname whisker_path 

whisker.path <- whisker_path 
