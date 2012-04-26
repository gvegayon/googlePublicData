################################################################################
# EXAMPLE SESION
# In this session we'll the package capabilities doing the following:
#  1) 
#
################################################################################
rm(list=ls())

library(rdspl)

setwd("c:/comandos_paquetes_librerias/r/rdspl/playground/")

dspl(
  providerURL="http://www.spensiones.cl",
  description= "Builded using \"rdspl\" library (http://code.google.com/p/rdspl)",
  lang="es",
  name="Chilean Unemployment Insurance Statistics",
  providerName="Chilean Pension Supervisor",
  path="unemployment_insurance/", 
  output="mi_dspl_sc.zip", 
  replace=T,
  extension="xls",
  timeFormat="yyyy-MM"
  )
  

moreinfocasen <- genMoreInfo(
  action="replace",
  path="casen/",
  encoding="UTF-8",
  sep=","
  )

# The column names come aren't as we would like to. So the 
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


x <- dspl(
  providerURL="http://www.mideplan.cl",
  description= "Builded using \"rdspl\" library",
  lang="es",
  name="CASEN",
  providerName="MDS",
  path="casen/", 
  output="mi_dspl_casen.zip", 
  replace=T, 
  sep=",", 
  encoding="UTF-8",
  timeFormat="yyyy",
  moreinfo=moreinfocasen
  )