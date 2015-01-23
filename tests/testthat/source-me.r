#' This file is used as a test to see if whisker_get_all can be used within 
#' a function and sourced in a file.


f2 <- function() { 

  tmpl = "A is rank {{a}}; z is rank {{z}}"
  whisker_get_all( tmpl )

}

x <- f2()
