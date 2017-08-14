context("Main function")

test_that("dspl", {
  path <- system.file("data", package="googlePublicData")
  suppressMessages(dat <- dspl(path))
  expect_output(print(dat), "<dspl")
  expect_output(print(summary(dat)))
  
})