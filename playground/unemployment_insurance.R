rm(list=ls())

library(rdspl)
library(xlsx)
library(XML)

setwd("c:/comandos_paquetes_librerias/r/rdspl/playground/")

moreinfosc <- genMoreInfo(action="replace",
  path="unemployment_insurance/",
  encoding="UTF-8",
  ext="xls"
  )

x <- dspl(
  providerURL="http://www.spensiones.cl",
  description= "Builded using \"rdspl\" library (http://code.google.com/p/rdspl)",
  lang="es",
  name="Chilean Unemployment Insurance Statistics",
  providerName="Chilean Pension Supervisor",
  path="unemployment_insurance/", 
  #output="mi_dspl_sc.zip", 
  replace=T, 
  extension="xls", 
  encoding="UTF-8",
  timeFormat="yyyy-mm",
  moreinfo=moreinfosc
  )
  

moreinfocasen <- genMoreInfo(
  action="replace",
  path="casen/",
  encoding="UTF-8",
  ext="csv"
  )

# Filling some info
moreinfocasen$label <- gsub("pob_", "población_", moreinfocasen$label)
moreinfocasen$label <- gsub("promedio_", "promedio_", moreinfocasen$label)
moreinfocasen$label <- gsub("_", " ", moreinfocasen$label)
moreinfocasen$label <- gsub("^porc", "%", moreinfocasen$label)
moreinfocasen$label <- gsub("agnos", "años", moreinfocasen$label)

moreinfocasen$topic[grep("hogar", moreinfocasen$label)] <- "Hogares"
moreinfocasen$topic[grep("educ|asiste|analfa|esco", moreinfocasen$label)] <- "Educación"
moreinfocasen$topic[grep("pobre|gini", moreinfocasen$label)] <- "Pobreza"
moreinfocasen$topic[grep("salud|pap|disca|obeso", moreinfocasen$label)] <- "Salud"
moreinfocasen$topic[grep("partici|ocupa|activ|trabaj", moreinfocasen$label)] <- "Empleo"
moreinfocasen$topic[-51:-54][is.na(moreinfocasen[-51:-54]$topic)] <- "Empleo"


dspl(
  providerURL="http://www.mideplan.cl",
  description= "Builded using \"rdspl\" library",
  lang="es",
  name="CASEN",
  providerName="MDS",
  path="casen/", 
  output="mi_dspl_casen.zip", 
  replace=T, 
  extension="csv", 
  encoding="UTF-8",
  timeFormat="yyyy",
  moreinfo=moreinfocasen
  )

dspl(
  providerURL="http://www.spensiones.cl",
  description= "Builded using \"rdspl\" library",
  lang="es",
  name="Chilean Pension System",
  providerName="Chilean Pension Supervisor",
  path="pensions/", 
  output="mi_dspl_pension.zip", 
  replace=T, 
  extension="xls",
  encoding="UTF-8",
  timeFormat="yyyy-mm"
  )