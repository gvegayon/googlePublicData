require(XML)
require(xlsx)
setwd('c:/comandos_paquetes_librerias/r/rdspl/')
source('pde.r', encoding='UTF-8')

pde <- compiler::cmpfun(pde)
 
mydspl <- pde(
  path='c:/comandos_paquetes_librerias/r/rdspl/series_sc/',
  output='c:/comandos_paquetes_librerias/r/rdspl/series_sc/',
  replace=T,
  timeFormat='yyyy-MM',
  lang=c('en','es'),
  name=c('Unemployment Insurance','Seguro de Cesantía'),
  description=c('Some unemployment insurance statistics','Algunas estadisticas de desempleo'),
  url='http://www.spensiones.cl/safpstats/stats/',
  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
  providerURL='http://www.spensiones.cl/',
  extension='xls',
  encoding='UTF-8')

mydspl

mydspl <- pde(
  path='c:/comandos_paquetes_librerias/r/rdspl/series_sc/',
  output=NA,
  replace=T,
  timeFormat='yyyy-MM',
  lang=c('en','es'),
  name=c('Unemployment Insurance','Seguro de Cesantía'),
  description=c('Some unemployment insurance statistics','Algunas estadisticas de desempleo'),
  url='http://www.spensiones.cl/safpstats/stats/',
  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
  providerURL='http://www.spensiones.cl/',
  extension='xls',
  encoding='UTF-8')

cat(mydspl$xml)

mydspl$variables