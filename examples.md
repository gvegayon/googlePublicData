# Some examples #

## Example 0 ##
```
directory <- 'c:/comandos_paquetes_librerias/r/rdspl/example'

# Running the Demonstration
demo(dspl)

# Basic DSPL
mydspl <- dspl(
  path=directory,
  timeFormat='yyyy-MM',
  lang='en',
  name='Unemployment Insurance',
  description='Some unemployment insurance statistics',
  extension='xls'
)

cat(mydspl2$xml) # Prints the XML file

View(mydspl2$variables) # Views the variables
```

## Example 1 ##
```
# Output of the complete bundle adding some more info
mydspl <- dspl(
  path=directory,
  output='C:/Users/George/Desktop/mydspl.zip',
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
```

## Example 2 ##
```
# Generating a descriptive TAB file for the concepts adding topics and descriptions
genMoreInfo(directory, encoding='UTF-8', ext='xls', action='merge',
            output=paste(directory,'/config.tab',sep=''))

# Output of the complete bundle adding a descriptive file (moreinfo)
mydspl <- dspl(
  path=directory,
  output='C:/Users/George/Desktop/mydspl.zip',
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
```

&lt;wiki:gadget url="http://wiki.rdspl.googlecode.com/git/iframes/example3\_pde.xml" width="500" height="350"/&gt;

You can [see the xml results here](http://www.google.com/publicdata/explore?ds=z7j7rseag2fj1j_)