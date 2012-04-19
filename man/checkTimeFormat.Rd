\name{checkTimeFormat}
\alias{checkTimeFormat}
\alias{timeFormat}
\alias{joda-times}
\title{DSPL time format verification}
\description{
  Checks if a string fulfills the joda-times class specifications supported by DSPL language.
}
\usage{
  checkTimeFormat(fmt)
}
\arguments{
  \item{fmt}{String representing a time format to be verified.}
}
\details{
  \tabular{ll}{
    Format \tab Example\cr
    "yyyy" \tab 1988\cr
    "yyyy-MM" \tab 1988-03\cr
    "yyyy-MMM" \tab 1988-Mar\cr
    "dd-MM-yyyy" \tab 02-03-1988
  }
}
\value{
  Logical. \code{TRUE} if the string passes the test.
}
\references{
  \itemize{
    \item Google Public Data Explorer: \url{https://developers.google.com/public-data/docs/canonical/time?hl=es}
    \item Joda Time 2.1 API: \url{http://joda-time.sourceforge.net/api-release/org/joda/time/format/DateTimeFormat.html}   
  }
}
\author{George Vega Yon <george.vega@nodoschile.org>}
\examples{
    checkTimeFormat("yyyy-MM")
}
\seealso{
  See also \code{\link{dspl}}
}