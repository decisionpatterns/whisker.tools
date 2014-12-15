library(testthat)

context( "whisker_get_all" )

tmpl <- "A is {{a}}; z is {{z}}"

NEWENV <- new.env() 
NEWENV$a <- 1
NEWENV$z <- 26
attach( NEWENV )


# BASIC TEST
  if( exists('x') ) rm(x)
  x <- whisker_get_all( tmpl )
  expect_equivalent( list2env(x), NEWENV )


NEWERENV <- new.env() 
NEWERENV$a <- "passed"
attach( NEWERENV, warn.conflicts = FALSE  )

# BASIC TESTS
  if( exists('x') ) rm(x)
  x <- whisker_get_all( tmpl )
  expect_equivalent( list2env(x), NEWERENV )
  
  rm( NEWENV, NEWERENV )  # Still on search path


# DOES `get` WORK IN .GlobalEnv ?
  f <- function() get("a", .GlobalEnv )
  expect_equivalent( f(), "passed" )


# ... IN .parent.frame ?

  f <- function() get("a", parent.frame() )
  expect_equivalent( f(), "passed" )


# ... DEFAULT ?
  f <- function() get( "a" )
  expect_equivalent( f(), "passed" )
  
# DOES whisker_get_all WHEN USING sourced?
  if( exists('x') ) rm(x)
  source( "source-me.r", local = TRUE  )
  expect_equal( x$a, "passed" )
  expect_equal( x$z, 26 )
  

# Clean-up 
  detach( NEWENV ); detach( NEWERENV )
  if( exists('x') ) rm(x)
  if( exists('f2') ) rm(f2)
