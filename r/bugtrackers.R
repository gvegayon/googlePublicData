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
  
  # Frequency table
  freq.tab <- as.data.frame(table(concepts$id), stringsAsFactors=F)
  colnames(freq.tab) <- c('id','freq')  
  dpl.concepts <- subset(freq.tab, freq > 1)
  
  # Number of duplicated concepts
  ndpl.concepts <- NROW(dpl.concepts)
  
  # If there are any dpl concepts
  if (ndpl.concepts > 0) {
    
    # Loop for each and one of the duplicated concepts
    for (dpl in dpl.concepts$id) {
      
      # Testing if all the data types of the dpl concepts is numeric
      test <- all(concepts[concepts$id == dpl,c('type')] %in% c('float', 'integer'))
      
      # Fixing the concept type
      if (test) {
        concepts[concepts$id == dpl,c('type')] <- 'float'
        warning(dpl,' concept was fixed in ',
                concepts[concepts$id == dpl, c('id','type')])
      }
      else {
        stop('Duplicated concepts cannot be homogenized\n',dpl,
             concepts[concepts$id == dpl, c('id','type')])
      }
      
      # Rebuilding the concepts list
      concepts <- unique(concepts)
    }    
  }
  return(concepts)
}