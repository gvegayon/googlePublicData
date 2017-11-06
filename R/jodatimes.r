.joda.times <- matrix(c(
    # Days
    '^[0-9]{4}[0-9]{2}([-]|[ ]|[/])?[0-9]{2}$', '^yyyy([-]|[ ]|[/])?MM([-]|[ ]|[/])?dd$', '1988-03-02',
    '^[0-9]{2}([-]|[ ]|[/])[0-9]{2}([-]|[ ]|[/])?[0-9]{4}$', '^dd([-]|[ ]|[/])?MM([-]|[ ]|[/])?yyyy$', '02-03-1988',
    '^[0-9]{4}([-]|[ ]|[/])[A-Za-z]{3}([-]|[ ]|[/])?[0-9]{2}$', '^yyyy([-]|[ ]|[/])?MMM([-]|[ ]|[/])?dd$', '1988-Mar-02',
    '^[0-9]{2}([-]|[ ]|[/])[A-Za-z]{3}([-]|[ ]|[/])?[0-9]{4}$', '^dd([-]|[ ]|[/])?MMM([-]|[ ]|[/])?yyyy$', '02-Mar-1988',    
    # Months
    '^[0-9]{4}([-]|[ ]|[/])?[0-9]{2}$', '^yyyy([-]|[ ]|[/])?MM$', '1988-03',
    '^[0-9]{4}([-]|[ ]|[/])?[A-Za-z]{3}$', '^yyyy([-]|[ ]|[/])?MMM$', '1988-Mar',
    '^[A-Za-z]{3}([-]|[ ]|[/])?[0-9]{4}$', '^MMM([-]|[ ]|[/])?yyyy$', 'Mar-1988',
    '^[0-9]{2}([-]|[ ]|[/])?[0-9]{4}$', '^MM([-]|[ ]|[/])?yyyy$', '03-1988',
    # Years
    '^[0-9]{4}$', '^yyyy$', '1998'
  ), ncol=3, byrow=T
)
colnames(.joda.times) <- c('regex','format','example')
.joda.times <- as.data.frame(.joda.times, stringsAsFactors=F)



#' DSPL time format verification
#' 
#' Checks if a string fulfills the joda-times class specifications supported by
#' DSPL language.
#' 
#' Public Data Explorer currently supports daily, monthly and yearly
#' distributed data. Joda-time, the corresponding time format on which DSPL
#' times is based, allows declaring time formats using small case "d" (for
#' days), capitalized "M" (for months) and small case "y" for years. Some
#' examples: \tabular{ll}{ Format Specification \tab Data Example\cr "yyyy"
#' \tab 1988\cr "yyyy-MM" \tab 1988-03\cr "yyyy-MMM" \tab 1988-Mar\cr
#' "dd-MM-yyyy" \tab 02-03-1988 }
#' 
#' @aliases checkTimeFormat timeFormat joda-times
#' @param fmt String representing a time format to be verified.
#' @return Logical. \code{TRUE} if the string passes the test.
#' @author George G. Vega Yon 
#' @seealso See also \code{\link{dspl}}
#' @references \itemize{ \item Google Public Data Explorer DSPL time
#' definition:
#' \url{https://developers.google.com/public-data/docs/canonical/time?hl=es}
#' \item Google Public Data Explorer Cookbook for time definitions:
#' \url{https://developers.google.com/public-data/docs/cookbook#time_recipes}
#' \item Joda Time 2.1 API:
#' \url{http://joda-time.sourceforge.net/api-release/org/joda/time/format/DateTimeFormat.html}
#' }
#' @keywords utilities
#' @export
#' @examples
#' 
#'     checkTimeFormat("yyyy-MM") # TRUE
#'     checkTimeFormat("MMMyyyy") # TRUE
#'     checkTimeFormat("mmmyyyy") # FALSE
#' 
checkTimeFormat <- function(fmt) {
################################################################################
# Checks if the specified timeFormat is supported by DSPL
################################################################################
  result <- lapply(
    .joda.times[,2], 
    function(X,Y) {grep(pattern=X,x=Y)}, 
    Y=fmt
    )
  result <- sum(unlist(result)) == 1
  return(result)
}
#checkTimeFormat("yyyy")
#checkTimeFormat("yyyyMM")
#checkTimeFormat("yyyy-MM")
#checkTimeFormat("yyyy/MM")
#checkTimeFormat("yyyy, MM")
#.joda.times <- as.data.frame(joda.times, stringsAsFactors = F)
# Example vector
# x <- c(1998, '2010-01', '2010-01-01')
#test <- c('02-03-2001', '1992', 'Ene-2008')

#lapply(.joda.times[,1], function(X,Y) {grep(pattern=X,x=Y,value=T)}, Y=test)

