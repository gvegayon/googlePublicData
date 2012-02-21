rm(list=ls())
require(XML)
require(xlsx)

directory <- 'c:/comandos_paquetes_librerias/r/rdspl/example'
funsource <- 'c:/comandos_paquetes_librerias/r/rdspl/r'
lapply(list.files(funsource, full.names=T), source, encoding='UTF-8')
pde <- compiler::cmpfun(pde)

# Basic DSPL
mydspl0 <- pde(
  path=directory,
  timeFormat='yyyy-MM',
  lang='en',
  name='Unemployment Insurance',
  description='Some unemployment insurance statistics',
  extension='xls'
)

mydspl0 # Prints the XML file (print method)
summary(mydspl0) # Prints a summary of the dataset

# Output of the complete bundle adding some more info
mydspl1 <- pde(
  path=directory,
  output=directory,
  replace=T,
  timeFormat='yyyy-MM',
  lang=c('en','es'),
  name=c('Unemployment Insurance','Seguro de Cesantía'),
  description=c('Some unemployment insurance statistics','Algunas estadisticas de desempleo'),
  url='http://www.spensiones.cl/safpstats/stats/',
  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
  providerURL='http://www.spensiones.cl/',
  extension='xls',
  encoding='UTF-8'
)

mydspl1 # final message

# Generating a descriptive TAB file for the concepts adding topics and descriptions
genMoreInfo(directory, encoding='UTF-8', ext='xls', action='merge',
            output=paste(directory,'/config.tab',sep=''))

# Output of the complete bundle adding a descriptive file (moreinfo)
mydspl2 <- pde(
  path=directory,
  output=directory,
  replace=T,
  timeFormat='yyyy-MM',
  lang=c('en','es'),
  name=c('Unemployment Insurance','Seguro de Cesantía'),
  description=c('Some unemployment insurance statistics','Algunas estadisticas de desempleo'),
  url='http://www.spensiones.cl/safpstats/stats/',
  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
  providerURL='http://www.spensiones.cl/',
  extension='xls',
  encoding='UTF-8',
  moreinfo=paste(directory,'config.tab',sep='/'))

mydspl2