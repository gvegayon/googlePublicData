rm(list=ls())

library(rdspl)
library(xlsx)

setwd("c:/comandos_paquetes_librerias/r/rdspl/playground/")

genMoreInfo(action="replace",
  path=getwd(),
  encoding="UTF-8",
  ext="xls",
  output="unemployment.dspl.tab"
  )

dspl(
  providerURL="http://www.spensiones.cl",
  description= "Builded using \"rdspl\" library",
  lang="es",
  name="Chilean Unemployment Insurance Statistics",
  providerName="Chilean Pension Supervisor",
  path="unemployment_insurance/", 
  output="mi_dspl.zip", 
  replace=T, 
  extension="xls", 
  encoding="UTF-8",
  timeFormat="yyyy-mm",
  moreinfo="unemployment_insurance/unemployment.dspl.tab"
  )
