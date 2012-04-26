################################################################################
# rdspl demo
# In this demo, we'll use the Public Data Explorer tutorial data available at:
#   https://developers.google.com/public-data/docs/tutorial
#
################################################################################
pause <- function() {  
  invisible(readline("\nPress <return> to continue: ")) 
}

# Complete directory path where the data is saved
data.path <- paste(.libPaths()[1],'/rdspl/data',sep='')
pause()

# First Simplest example, 
mydspl <- dspl(path=data.path, sep=";")

# Printing the data
pause()
mydspl

# Summary of the dspl class object
pause()
summary(mydspl)

# End of the demo