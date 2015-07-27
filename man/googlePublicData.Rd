\name{googlePublicData}
\alias{googlePublicData-package}
\alias{googlePublicData}
\docType{package}
\title{
  Working with Google's Public Data Explorer DSPL Metadata Files
}
\description{
\code{googlePublicData} package provides a collection of functions to set up Google Public Data Explorer data visualization tool with your own data, building automaticaly the corresponding DSPL (XML) metadata file jointly with the CSV files. All zipped up and ready to be published at Public Data Explorer. 

Also includes several data structure verifiers in order to avoid surprises while loading your ZIP file to Public Data Explorer page.
  
Please visit the project home for more information and examples: \url{http://github.com/gvegayon/googlePublicData}.
} 
\details{
  \tabular{ll}{
    Package: \tab googlePublicData\cr
    Type: \tab Package\cr
    Version: \tab 0.15.27\cr
    Date: \tab 2012-07-27\cr
    License: \tab MIT + file LICENSE\cr
  }
}
\author{George G. Vega Yon \email{gvegayon@caltech.edu}}
\references{
  \itemize{
    \item googlePublicData project site: \url{http://github.com/gvegayon/googlePublicData}
    \item Public Data Explorer site: \url{http://publicdata.google.com/}
    \item Public Data Explorer Developers site: \url{https://developers.google.com/public-data/}
    \item googleVis package: \url{http://code.google.com/p/google-motion-charts-with-r/}
  }
}
\examples{
  \dontrun{
    demo(dspl)
    }
}
\keyword{ package }
