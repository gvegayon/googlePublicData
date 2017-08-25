context("Main function")

test_that("dspl", {
  # Loading datasets
  
  data(countries)
  data(country_slice)
  data(gender_country_slice)
  data(genders)
  data(state_slice)
  data(states)
  
  path <- tempdir()
  
  write.table(countries, file = paste0(path,"/countries.tab"), sep = "\t")
  write.table(country_slice, file = paste0(path,"/country_slice.tab"), sep = "\t")
  write.table(gender_country_slice, file = paste0(path,"/gender_country_slice.tab"), sep = "\t")
  write.table(genders, file = paste0(path,"/genders.tab"), sep = "\t")
  write.table(state_slice, file = paste0(path,"/state_slice.tab"), sep = "\t")
  write.table(states, file = paste0(path,"/states.tab"), sep = "\t")
  
  path <- base::system.file("data", package="googlePublicData")
  suppressMessages(dat <- dspl(path))
  expect_output(print(dat), "<dspl")
  expect_output(print(summary(dat)))
  
})