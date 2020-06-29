#' test-whisker_names

context('whisker_names')

tmpl <- "THIS {{is}} A {{template}}"

res <- c('is', 'template')

expect_equal( whisker_names(tmpl), res)
expect_equal( whisker_vars(tmpl), res)
