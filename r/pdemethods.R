print.dspl <- function(x, path=NULL, replace=F, ...) {
################################################################################
# Printing method
################################################################################  
  if (!is.null(path)) {
  # If output is defined
    
    # Does the file already exists?
    test <- file.exists(path)
    
    # In the case of existance and not replace defined
    if (!replace & test) {
      stop('File ',path,' already exists. Replacement must be explicit.')
    }
    
    # In the case of existance and replace defined
    else if (replace & test) {
      file.remove(path)
      warning('File ', path, ' will be replaced.')
    }
    
    con <- file(description=path, open="w", encoding="UTF-8")
    cat(x$dspl, file=con)
    close.connection(con)
  } 
  else {
    cat(x$dspl, ...)
  }
}

summary.dspl <- function(x) {
  ################################################################################
  # Summary method
  ################################################################################  
  cat('Attributes\n')
  print(attributes(x))
  cat('Dataset contents\n')
  x[c('dimtabs', 'slices', 'concepts',
            'dimentions','statistics')]
}