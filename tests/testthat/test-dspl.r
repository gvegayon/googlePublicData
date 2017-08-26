context("Main function")

test_that("dspl", {
  # Loading datasets
  
  path <- base::system.file("dspl-tutorial", package="googlePublicData")
  
  suppressMessages(dat <- dspl(path))
  expect_output(print(dat), "<dspl")
  expect_output(print(summary(dat)))
  
})