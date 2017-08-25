context("Main function")

test_that("dspl", {
  # Loading datasets
  
  path <- base::system.file("google", "countries.csv", package="googlePublicData")
  path <- gsub("countries.csv", "", path)
  
  suppressMessages(dat <- dspl(path))
  expect_output(print(dat), "<dspl")
  expect_output(print(summary(dat)))
  
})