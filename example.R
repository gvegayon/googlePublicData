require(XML)
require(xlsx)
setwd('c:/comandos_paquetes_librerias/r/rdspl/')
source('pde.r', encoding='UTF-8')

mydspl <- pde(
  path='c:/comandos_paquetes_librerias/r/rdspl/series_sc/',
  output=NA,
  replace=T,
  timeFormat='yyyy',
  lang=c('en','es'),
  name=c('Unemployment Insurance','Seguro de Cesantía'),
  description=NA,
  url=NA,
  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
  providerURL=NA,
  extension='xls',
  encoding='latin1')

cat(mydspl$xml, encoding='latin1')

cat(mydspl$variables)