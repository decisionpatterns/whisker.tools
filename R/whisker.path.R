#' render.path
#' 
#' Combines \code{\link[base]{file.path}} except arguments are run through 
#' \code{\link[whisker]{whisker.render}} first,
#' 
#' @param ... character; defining a path
#' @param data named list or environment with variables that will be used during
#'        rendering 
#' @param fsep character; the path separator to use
#' 
#' @note
#'   Whisker variables cannot contain '.' by specification, therefore the 
#'   template cannot use names with '.'
#' 
#' @examples 
#'   dir <- "~/tmp"
#'   file_name <- "myfile"
#'   whisker.path( "{{dir}}", "{{file_name}}.txt" )
#'   
#' @export
#' @import whisker

whisker.path <- function( ..., data=parent.frame(), fsep=.Platform$file.sep ) { 

  template <- Reduce( 
    function(x,y) file.path( x,y, fsep=fsep), list(...) 
  )
  
  return( 
    whisker::whisker.render( template, data=data )
  )
  
}
