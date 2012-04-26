\name{dspl Methods}
\alias{print.dspl}
\alias{summary.dspl}

\title{
  Print and summarize dspl objects
}
\description{
  Methods to print and summarize \code{dspl} class objects
}
\usage{  
  \method{print}{dspl}(x, path=NULL, replace=F, ...)
  
  \method{summary}{dspl}(object, ...)
}
\arguments{
  \item{x}{An object of class \code{dspl} to be printed.}
  \item{object}{An object of class \code{dspl} to be summarized.}
  \item{path}{String. Output path where to save the XML DSPL file.}	
  \item{replace}{Logical. If \code{path} exists, \code{TRUE} would replace the file.}
  \item{\dots}{arguments passed on to \code{\link{cat}} (\code{print.dspl})}
}

\details{
}
                           
\value{
\item{\code{print.dspl}}{ None (invisible \code{NULL}).}

\item{\code{summary.dspl}}{Returns the class attributes and a list containing as defined by \code{\link{dspl}} function. For more information see its value section.}
}
\author{George Vega Yon \email{george.vega@nodoschile.org}}

\seealso{
  See also \code{\link{dspl}}
}
\examples{
  \dontrun{
    # Parsing some xlsx files at "my stats folder"
    mydspl <- dspl(path="my stats folder/", ext="xls")
    
    # Checking the summary of the data bundle
    summary(mydspl)
    
    # Writing the DSPL XML definition into a file
    print(mydspl, path="my stats folder/mydspl.xml")
    
  }
}
\keyword{ methods }