#' whisker_names
#'
#' Extract varaibles names from a whisker template
#'
#' @param template character of template text
#'
#' Provides a stringr type function for extracting the names for the
#' substituted variable. This is useful if you want to do some checking or
#' other manipulation of the template prior to rendering.
#'
#' @references
#'   See for example, \url{http://stackoverflow.com/a/16596015/1504321}
#'
#' @return
#'   chracter vector of names found in the template
#'
#' @seealso
#'   \code{\link{whisker_render}} \cr
#'   \code{\link[stringi]{stri_extract_all_regex}} on which this function relies
#'
#' @examples
#'   template <- "Dear {{name}}, I have not loved you since {{date}}"
#'
#'   whisker_names(template)
#'
#'
#' @export
#' @import stringi

whisker_names <- function(template) {

  variables <-
    # stringr::str_extract_all( template, pattern=regex( '{{(.+?)}}' ) )
    stringi::stri_match_all_regex( template, pattern='\\{\\{(.+?)\\}\\}' )[[1]][,2]

  unlist(variables)
}
