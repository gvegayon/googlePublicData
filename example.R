require(XML)
require(xlsx)

directory <- 'c:/comandos_paquetes_librerias/r/rdspl/example'
funsource <- 'c:/comandos_paquetes_librerias/r/rdspl/pde.r'
source(funsource, encoding='UTF-8')
pde <- compiler::cmpfun(pde)

# Basic DSPL
mydspl <- pde(
  path=directory,
  timeFormat='yyyy-MM',
  lang='en',
  name='Unemployment Insurance',
  description='Some unemployment insurance statistics',
  extension='xls'
)

cat(mydspl2$xml) # Prints the XML file

View(mydspl2$variables) # Views the variables

# Output of the complete bundle adding some more info
mydspl <- pde(
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

mydspl # final message

# Generating a descriptive TAB file for the concepts adding topics and descriptions
genMoreInfo(directory, encoding='UTF-8', ext='xls', action='merge',
            output=paste(directory,'/config.tab',sep=''))

# Output of the complete bundle adding a descriptive file (moreinfo)
mydspl <- pde(
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