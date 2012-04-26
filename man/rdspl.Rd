\name{rdspl}
\alias{rdpls-package}
\alias{rdspl}
\docType{package}
\title{
  An R library to build Google's Public Data Explorer DSPL Metadata
}
\description{
\code{rdspl} package provides a collection of functions to set up Google Public Data Explorer data visualization tool with your own data, building automaticaly the corresponding DSPL (XML) metadata file jointly with the CSV files. All zipped up and ready to be published at Public Data Explorer. 

Also includes several data structure verifiers in order to avoid surprises while loading your ZIP file to Public Data Explorer page.
  
Please visit the project home for more information and examples: \url{https://code.google.com/p/rdspl}.
} 
\details{
  \tabular{ll}{
    Package: \tab rdspl\cr
    Type: \tab Package\cr
    Version: \tab 0.12.04.20\cr
    Date: \tab 2012-04-20\cr
    License: \tab GPL version 2 or later\cr
  }
}
\author{
  George Vega Yon \email{george.vega@nodoschile.org}
}
\references{
  \itemize{
    \item rdspl project site: \url{https://code.google.com/p/rdspl}
    \item Public Data Explorer site: \url{http://publicdata.google.com/}
    \item Public Data Explorer Developers site: \url{https://developers.google.com/public-data/}
    \item DSPL Code site: \url{http://code.google.com/p/dspl/}
    \item googleVis package: \url{http://code.google.com/p/google-motion-charts-with-r/}
  }
}
\examples{
  \dontrun{
    demo(dspl)
    }
}
\keyword{ package }