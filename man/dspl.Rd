\name{dspl}
\alias{dspl}  
\title{Builds DSPL metadata file}
\description{Parsing CSV, TAB or XLS(X) files at a specific directory path, dspl
             generates a complete DSPL file ready to be uploaded to Googles
             Public Data Explorer.}
\usage{
  dspl(path, output=NA, replace=F, targetNamespace="", timeFormat="yyyy",
       lang=c("es","en"), name=NA, description=NA, url=NA, providerName=NA,
       providerURL=NA, extension="csv", encoding="UTF-8", fileEncoding="UTF-8",
       moreinfo=NA)
}
\arguments{
  \item{path}{Full path to the folder where the tables are saved.}
  \item{output}{Optional. Full path to the output ZIP file.}
  \item{replace}{In the case of defining output, replaces the files.}
  \item{timeFormat}{The corresponding time format of the collection.}
  \item{lang}{A list of the languages supported by the dataset.}
  \item{name}{The name of the dataset.}
  \item{description}{The dataset description.}
  \item{url}{The corresponding URL for the dataset.}
  \item{providerNAme}{}
  \item{providerURL}{}
  \item{extension}{The extension of the tables in the 'path' folder.}
  \item{encoding}{The char encoding of the input tables.}
  \item{fileEncoding}{The tables files encoding.}
  \item{moreinfo}{}
}
\value{
  If no \code{output} defined, \code{dspl} returns list of \code{\link{class}}
  "\code{dspl}".   
  
  An object of class "\code{dspl}" is a list containing:
  \item{\code{dspl}}{A character printed version of the DSPL file.}
  \item{\code{concepts.by.table}}{A DF of concepts stored by table.}
  \item{\code{dimtabs}}{A DF dimentional tables.}
  \item{\code{slices}}{A DF slices.}
  \item{\code{concepts}}{A DF concepts.}
  \item{\code{dimentions}}{A DF of dimentional concepts.}
  \item{\code{statistics}}{A matrix of statistics.}
  
  otherwise the function will build a ZIP file as specified in the output containing
  the CSV and XML files.
}
\references{
  Google Public Data Explorer:
  \url{http://publicdata.google.com} 
}
\author{George Vega Yon <g,vega@gmail.com>}