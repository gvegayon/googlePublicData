checkSlices <- function(dims, by) {
  ################################################################################
  # Checks if there's any pair of slices with the same dimentions (error)
  ################################################################################
  # Builds a list of dims by slice
  slices.dims <- do.call(list,by(dims, by, function(x) unlist(x[order(x)])))
  
  # Generates a list of cohorts (unique) that shouldn't be store more than once
  unique.dims <- unique(slices.dims)
  
  for (i in 1:length(unique.dims)) {
    # Sets the counters
    counter <- 0
    fields <- NULL
    for (j in names(slices.dims)) {
      test <- identical(slices.dims[[j]], unique.dims[[i]])
      
      if (test) {counter <- counter + 1; fields <- paste(fields, j, sep=',')}
      if (counter > 1) {
        stop("Dimention(s) ", unlist(unique.dims[[i]]),
             " apear more than once in the collection at ", fields,
             ". Variables in those tables should be grouped in only one table.")
      }
    }
  }
}

checkDuplConcepts <- function(concepts) {
  ################################################################################
  # Checks if there's any concepts duplicated as a result of multiple data types
  # In the case of beeing all numeric, DSPL assumes the minumum common (float) and
  # fixes the error. Output = Warning
  ################################################################################  
  
  concepts2 <- unique(
    subset(concepts,subset=type != 'date' & is.dim.tab==F, select=-slice)
    )
  
  # Frequency table
  freq.tab <- as.data.frame(table(concepts2$id), stringsAsFactors=F)
  colnames(freq.tab) <- c('id','freq')  
  dpl.concepts <- subset(freq.tab, freq > 1)
  
  # Number of duplicated concepts
  ndpl.concepts <- NROW(dpl.concepts)
  
  # If there are any dpl concepts
  if (ndpl.concepts > 0) {
    
    # Loop for each and one of the duplicated concepts
    for (dpl in dpl.concepts$id) {
      
      # Testing if all the data types of the dpl concepts is numeric
      test <- all(concepts$type[concepts$id == dpl] %in% c('float', 'integer'))
      
      # Fixing the concept type
      if (test) {
        touse <- which(concepts$id == dpl)
        concepts$type[touse] <- "float"
        warning(dpl,' concept was fixed at slices: \n - ',
                paste(unique(concepts$slice[touse]), collapse='\n - '))
      }
      else {
        stop('Duplicated concepts cannot be homogenized\n',dpl,
             concepts[concepts$id == dpl, c('id','type')])
      }
    }    
  }
  return(concepts)
}