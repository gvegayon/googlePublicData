[![Downloads](http://cranlogs.r-pkg.org/badges/googlePublicData?color=brightgreen)](http://cran.rstudio.com/package=googlePublicData)
[![Travis-CI Build Status](https://travis-ci.org/gvegayon/googlePublicData.svg?branch=master)](https://travis-ci.org/gvegayon/googlePublicData)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/gvegayon/googlePublicData?branch=master&svg=true)](https://ci.appveyor.com/project/gvegayon/googlePublicData)


#googlePublicData#
An *R* Library (trying to) to build *Google's* _Data Sets Publication Language_ (DSPL) metadata input for *Public Data Explorer*. Based on the XML package and xlsx package to get full integration with MS Office.

Features:
  * Reads tab, csv, xls and xlsx from a folder.
  * Identifies data types and distinguishes between dimentional and metric concepts.
  * Identifies dimentional data tabs.
  * Auto generates conceps id.
  * Auto data sorting on dimentional (no time) concepts.
  * Prints XML and csv files to upload to Public Data Explorer.
  * Some bug trackers before final printing XML.
  * Builds ZIP file containing CSV and XML files.

So you don't need to mess with the XML coding at all!

*An example*
```

> dspl(
+  path='mycomputer/folder_where_xls_files_are_stored',
+  output='mycomputer/folder_where_results_should_go/my_zip.zip',
+  replace=T,
+  timeFormat='yyyy-MM',
+  lang=c('en','es'),
+  name=c('Unemployment Insurance','Seguro de Cesantía'),
+  description=c('Some unemployment insurance statistics','Algunas estadisticas de desempleo'),
+  url='http://www.spensiones.cl/safpstats/stats/',
+  providerName=c('Chilean Pension Supervisor','Superintendencia de Pensiones, Chile'),
+  providerURL='http://www.spensiones.cl/',
+  extension='xls',
+  encoding='UTF-8',
+  moreinfo='mycomputer/config.tab'
+)

10 files found...
Output defined
Results will be saved at
mycomputer/folder_where_results_should_go/r_dspl
afiliaciones.xlsx analized correctly, ordered by  afiliacion name  and exported as csv
contratos.xlsx analized correctly, ordered by  contrato name  and exported as csv
fondos.xlsx analized correctly, ordered by  fondo name  and exported as csv
fondos_mensual_fondo.xls analized correctly, ordered by  fondo  and exported as csv
personas_mes.xlsx analized correctly, ordered by    and exported as csv
personas_mes_afiliacion.xls analized correctly, ordered by  afiliacion  and exported as csv
personas_mes_contrato.xlsx analized correctly, ordered by  contrato  and exported as csv
personas_mes_contrato_sexo.xls analized correctly, ordered by  contrato sexo  and exported as csv
personas_mes_sexo.xlsx analized correctly, ordered by  sexo  and exported as csv
sexos.xlsx analized correctly, ordered by  sexo name  and exported as csv

[1] "Metadata created successfully at mycomputer/folder_where_results_should_go/r_dspl/metadata.xml"
```

[Check out the resulting XML](https://code.google.com/p/rdspl/source/browse/example/r_pde/metadata.xml) and the [PDE output](http://www.google.com/publicdata/explore?ds=z7j7rseag2fj1j_&ctype=l&strail=false&bcs=d&nselm=h&met_y=afiliados_que_recibieron_pago_de_la_prestacion_por_cesantia&scale_y=lin&ind_y=false&rdim=sexo&idim=sexo:H:M:NA&ifdim=sexo&tdim=true&tstart=1035082800000&tend=1324350000000)

[one pretty example](http://www.google.com/publicdata/explore?ds=k9eg0lf9k0fgj_&ctype=b&strail=false&bcs=d&nselm=s&met_y=prom_de_escolaridad&scale_y=lin&ind_y=false&met_x=porc_familias_pobres&scale_x=lin&ind_x=false&met_c=porc_de_menores_de_6_agnos_con_sobrepeso_u_obeso&scale_c=lin&ind_c=false&met_s=tasa_de_inactividad&scale_s=lin&ind_s=false&ifdim=region&tunit=Y&pit=1143187200000&hl=es&dl=es&ind=false&icfg&iconSize=0.5&draft)

[and here is another one (multilanguage)](http://www.google.com/publicdata/explore?ds=lt98u9rd734rn_)
