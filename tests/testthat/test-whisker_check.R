context("whisker_check")

## TODO: Rename context
## TODO: Add more tests
tmpl <- "Hello {{Who}}"


test_that( "whisker_check", { 

  expect_true( whisker_check( tmpl, list(Who = "World" )) )      # TRUE
  expect_false( whisker_check( tmpl, data=list(Person = "World" )) )  # FALSE 

})