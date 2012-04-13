rm(list=ls())

library(rdspl)
library(xlsx)

setwd("c:/comandos_paquetes_librerias/r/rdspl/playground/unemployment_insurance/")

genMoreInfo(action="replace",
  path=getwd(),
  encoding="UTF-8",
  ext="xls",
  output="unemployment.dspl.tab"
  )

dspl(path=getwd(), output=getwd(), replace=T, extension="xls", encoding="UTF-8",
     moreinfo="unemployment.dspl.tab")
