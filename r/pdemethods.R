print.pde <- function(x, path=NULL, replace=F, ...) {
  ################################################################################
  # Printing method
  ################################################################################  
  if (!is.null(path)) {
    test <- file.exists(path)
    if (!replace & test) {
      stop('File ',path,' already exists. Replacement must be explicit.')
    }
    else if (replace & test) {
      file.remove(path)
      warning('File ', path, 'will be replaced.')
    }
    
    result <- file(path, encoding='UTF-8')
    cat(x$dspl, file=path, append=F, ...)
    close.connection(con=result)
  } 
  else {
    cat(x$dspl, ...)
  }
}

summary.pde <- function(x) {
  ################################################################################
  # Summary method
  ################################################################################  
  cat('Attributes\n')
  print(attributes(x))
  cat('Dataset contents\n')
  mydspl0[c('dimtabs', 'slices', 'concepts',
            'dimentions','statistics')]
}