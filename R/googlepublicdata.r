#' @importFrom XML newXMLNode newXMLDoc newXMLNamespace newXMLCommentNode saveXML
#' @importFrom utils zip read.table write.table head
#' @importFrom readxl read_excel
NULL

#' World countries example data set
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the basic columns used to define geographical dimensions, in this case,
#' countries.
#' 
#' 
#' @name countries
#' @docType data
#' @format A data frame containing 5 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL





#' Some countries statistics
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the population magnitudes at country level since 1960 to 1963.
#' 
#' 
#' @name country_slice
#' @docType data
#' @format A data frame containing 13 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL





#' Print and summarize dspl objects
#' 
#' Methods to print and summarize \code{dspl} class objects
#' 
#' 
#' @aliases print.dspl summary.dspl
#' @param x An object of class \code{dspl} to be printed.
#' @param object An object of class \code{dspl} to be summarized.
#' @param path String. Output path where to save the XML DSPL file.
#' @param replace Logical. If \code{path} exists, \code{TRUE} would replace the
#' file.
#' @param quiet Whether or not to print information on the screen
#' @param \dots arguments passed on to \code{\link{cat}} (\code{print.dspl})
#' @return \item{list("print.dspl")}{ None (invisible \code{NULL}).}
#' 
#' \item{list("summary.dspl")}{Returns the class attributes and a list
#' containing as defined by \code{\link{dspl}} function. For more information
#' see its value section.}
#' @author George G. Vega Yon 
#' @seealso See also \code{\link{dspl}}
#' @keywords methods
#' @examples
#' 
#'   \dontrun{
#'     # Parsing some xlsx files at "my stats folder"
#'     mydspl <- dspl(path="my stats folder/")
#'     
#'     # Checking the summary of the data bundle
#'     summary(mydspl)
#'     
#'     # Writing the DSPL XML definition into a file
#'     outputfile <- tempfile()
#'     print(mydspl, path=outputfile)
#'     
#'   }
#' @name dspl-methods
NULL





#' Some Countries statistics at Gender level
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the population magnitudes at country and gender level since 1960 to 1961.
#' 
#' 
#' @name gender_country_slice
#' @docType data
#' @format A data frame containing 13 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL





#' Genders example data set
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the basic columns used to define a categorical dimensions such as gender.
#' 
#' 
#' @name genders
#' @docType data
#' @format A data frame containing 2 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL





#' Working with Google's Public Data Explorer DSPL Metadata Files
#' 
#' \code{googlePublicData} package provides a collection of functions to set up
#' Google Public Data Explorer data visualization tool with your own data,
#' building automatically the corresponding DSPL (XML) metadata file jointly
#' with the CSV files. All zipped up and ready to be published at Public Data
#' Explorer.
#' 
#' Also includes several data structure verifiers in order to avoid surprises
#' while loading your ZIP file to Public Data Explorer page.
#' 
#' Please visit the project home for more information and examples:
#' \url{http://github.com/gvegayon/googlePublicData}.
#' 
#' 
#' @name googlePublicData
#' @aliases googlePublicData-package googlePublicData
#' @docType package
#' @author George G. Vega Yon 
#' @references \itemize{
#' \item googlePublicData project site:
#' \url{http://github.com/gvegayon/googlePublicData}
#' \item Public Data Explorer
#' site: \url{http://publicdata.google.com/}
#' \item Public Data Explorer
#' Developers site: \url{https://developers.google.com/public-data/}
#' \item
#' googleVis package:
#' \url{https://github.com/mages/googleVis#googlevis} }
#' @keywords package
#' @examples
#' 
#'   \dontrun{
#'     demo(dspl)
#'     }
#' 
NULL





#' Some US States statistics
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the population magnitudes and unemployment rate at state level since 1960 to
#' 1963.
#' 
#' 
#' @name state_slice
#' @docType data
#' @format A data frame containing 9 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL





#' US states example data set
#' 
#' This data set is one used in the DSPL Tutorial. Specifically, it contains
#' the basic columns used to define geographical dimensions, in this case, US
#' States.
#' 
#' 
#' @name states
#' @docType data
#' @format A data frame containing 8 observations.
#' @source DSPL Google Code Page Downloads:
#' \url{https://developers.google.com/public-data/docs/tutorial}
#' @keywords datasets
NULL



