################################################################################
# EXAMPLE SESION
# In this session we'll the package capabilities doing the following:
#  1) 
#
################################################################################
rm(list=ls())

library(googlePublicData)

dspl(
  providerURL="http://www.casen.cl",
  description= "Built using \"googlePublicData\" (https://github.com/gvegayon/googlePublicData)",
  lang="es",
  name="CASEN",
  providerName="MDS",
  path="playground/casen", 
  output="mi_dspl_sc.zip", 
  replace=TRUE,
  sep=",",
  timeFormat="yyyy-MM"
  )
  

moreinfocasen <- genMoreInfo(
  action="replace",
  path="playground/casen/",
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
# moreinfocasen$topic[-51:-54][is.na(moreinfocasen[-51:-54]$topic)] <- "Empleo"


dspl(
  providerURL="http://www.casen.cl",
  description= "Built using \"googlePublicData\" (https://github.com/gvegayon/googlePublicData)",
  lang="es",
  name="CASEN",
  providerName="MDS",
  path="playground/casen/", 
  output="mi_dspl_casen.zip", 
  replace=T, 
  sep=",", 
  encoding="UTF-8",
  timeFormat="yyyy",
  moreinfo=moreinfocasen
  )
