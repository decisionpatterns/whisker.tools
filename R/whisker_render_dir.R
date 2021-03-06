#' Render all the templates in a directory
#' 
#' @param path character; path to single directory containing templates 
#' @param out  character; path to single directory where rendered files are 
#'   written. 
#' @param data named list or environment with variables that will be used 
#'   during rendering
#' @param ... additional arguments
#' 
#' @import utils
#' @export   

whisker_render_dir <- function( path, out=".", data=parent.frame(), ... ) { 
  
  path <- normalizePath(path)
  out  <- normalizePath(out) 
  
  # PATH:
  if( ! utils::file_test( "-d", path ) )
    stop( paste0( "'", path, "' path does not exist.") )
  
  # OUT:
  if( utils::file_test( "-f", out ) )
    stop( paste0( "'", out, "' file already exists." ))
  
  if( ! utils::file_test( "-d", out ) )
    dir.create( out, recursive = TRUE )
  
  # PROCESS TEMPLATES
  files <- dir( path, full.names = FALSE, recursive = TRUE  )
  
  for ( file in files ) { 
    tmpl <- readLines( file.path( path, file) , ...)
    txt <- whisker_render( tmpl, data )    
    outpath <- file.path( out, file )
    writeLines( txt, outpath )
  }
    
}
