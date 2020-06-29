library(testthat)

context( 'whisker_render_dir' )

path <- # if ( interactive() ) "tests/testthat/templates/" else 
  "templates"
tmp <- tempdir() 
out <- file.path(tmp, "whisker.tools")

dir.create(out)   

data <- list( foo = 'me', bar = 'you' )

whisker_render_dir( path=path, out=out, data=data  )
  
# RENDERED TEMPLATES EXIST
  files <- dir( out, recursive = TRUE )
  expect_equal( files[[1]], "tmpl-1" )
  expect_equal( files[[2]], "tmpl-2" )

# TEMPLATE CONTENTS
  tmpl_1 <- readLines( file.path( out, "tmpl-1" ))
  expect_equal( tmpl_1[[1]], "Hello me," )
  expect_equal( tmpl_1[[2]], "Love, you" )

  tmpl_2 <- readLines( file.path( out, "tmpl-2" ))
  expect_equal( tmpl_2[[1]], "Hello you," )
  expect_equal( tmpl_2[[2]], "Love, me" )

# DEEP RECURSION
  # ...

# CLEANUP
  unlink(out, recursive = TRUE)
