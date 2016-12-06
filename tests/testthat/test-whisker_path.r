#' test-whisker_path

context('whisker_path')


dat = list( path1 = "path", path2 = "to", path3 = "myfiles")
result = "path/to/myfiles"

test_that( "whisker_path", {
  
  expect_identical( 
    whisker_path( "{{path1}}", "{{path2}}", "{{path3}}", data=dat ),
    result
  )
  
} ) 