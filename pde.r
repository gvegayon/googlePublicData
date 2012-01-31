#rm(list=ls())

# Dependencies
require(XML)
require(xlsx)

#archivo <- 'c:/rdspl/series_sc'

seekTables <- function(paths, encoding='UTF-8', ext='csv', output, replace, metrics) {
################################################################################
# Reads .csv and .xls(x) files, exports them as csv and outputs a descriptive ma
# trix. Also determinates which field is dim or metric.
################################################################################  
  vars <- NULL
  
  if (replace & !is.na(output)) {
    try(dir.create(path=paste(output,'/r_pde',sep=''),showWarnings=F), silent=T)
  } else if (!replace & !is.na(output)) {
    stop(call='Directorio ya existe, debe hacer explícito el reemplazo de este.')
  }
  sapply(paths,
         function(x,y) {
           # Reads each file, gets the variables names and datatypes
           exts <- matrix(c('csv', ',', 'tab', '\t'),ncol=2,byrow=T)
           if (ext %in% exts[,1]) {
             
             cols <- read.table(paste(output,'/',x,sep=''),sep=exts[exts[,1] == ext,2],
                                header=F, nrows=1, encoding=y)
             
             cols <- as.character(cols)
             data <- read.table(x,sep=exts[exts[,1] == ext,2], skip=1, header=F,dec=',')
             colnames(data) <- cols
           } else {
             cols <- read.xlsx(x, sheetIndex=1, header=F,rowIndex=0:1,encoding=y)
             cols <- as.character(cols,deparse=T)
             data <- read.xlsx(x, sheetIndex=1, header=F,rowIndex=2:2000)
           }
           fnames <- x
           for (i in c('.csv','.tab','.xlsx','.xls')) {
            fnames <- gsub(i, '', fnames, fixed=T)
           }
           fnames <- rep(fnames, length(cols))
           
           # Builds descriptive matrix
           var <- c(
             cleantext(cols),
             cols,
             fixType(unlist(lapply(data, typeof))),
             fnames)
           var <- matrix(var, ncol = 4)
           
           # Creates a new column of metric vs dimm
           var <- cbind(var, 'metric')
           
           var[var[,1] %in% metrics[,1], 5] <- 'dimension' # If time
           var[var[,3] %in% 'string',5] <- 'dimension' # If string
           var[var[,1] %in% metrics[,1], 3] <- 'date' # If date
           
           # Identifies which dataset is a dimension dataset
           var <- cbind(var, V6 = F)
           if (all(var[,3] != 'date')) {var[,6] <- T}
           
           # Replaces the date-time colnames for those proper to PDE
           for (i in 1:NROW(metrics)) {cols <- gsub(metrics[i,1], metrics[i,2], 
                                                    cleantext(cols), fixed = T)}
           
           var[,1] <- cols

           vars <<- rbind(vars, var)

           # In the case of output, it creates a new folder
           if (!is.na(output)) {
             colnames(data) <- cols
             write.table(data, file=paste(output,'/r_pde/',var[1,4],'.csv',sep=
               ''), na='', sep=',', quote=F, fileEncoding=y, row.names=F)
           }
         }, y=encoding)
  
  # Identifies where are the correspondant tables for each dimension
  vars <- cbind(vars, V7 = NA)
  for (i in 1:NROW(vars)) {
    if (vars[i,5] == 'dimension' & vars[i,3] != 'date' & vars[i,6] != 'TRUE') {
      delta <- try(vars[vars[,1]==vars[i,1] & vars[,6] == 'TRUE',4])
      
      if (length(delta) == 0) {
        stop('Error')
      } else {
        vars[i,7] <- delta
      }
    }
  }
  return(vars)
}

fixType <- function(x) {
  ################################################################################
  # Transforms the datatypes in function of allowed datatypes for DSPL
  ################################################################################
  replace <- matrix(c('logical', 'integer', 'double', 'complex', 'character',
                      'boolean', 'integer', 'float', 'float', 'string'), ncol =2)
  for (i in 1:5) x <- as.character(gsub(replace[i,1], replace[i,2],x, fixed=T))
  return(x)
}

cleantext <- function(x) {
  ################################################################################
  # Adapts labels to IDs
  ################################################################################  
  lcase <- matrix(c("á", "a", "é", "e", "í", "i", 'ó', 'o', "ú", "u", "ñ", 
                    "gn", "ý", "y"), ncol = 2, byrow = T)
  
  sym <- matrix(c("$", "money", "°", "grad", "#", "n", "%", "pcent", "…", 
                  "___", " ", "_", ".", "", ",", "_", ";", "_", ":", "_"), 
                ncol = 2, byrow = T)
  
  x <- tolower(x)
  
  for (i in 1:NROW(lcase)) {
    x <- gsub(lcase[i,1], lcase[i,2], x, fixed = T)
  }
  
  for (i in 1:NROW(sym)) {
    x <- gsub(sym[i,1], sym[i,2], x, fixed = T)
  }
  
  return(x)
}

addInfo <- function(nodename,values,parent,lang) {
  ################################################################################
  # Function to add information and provider nodes y multiple languages
  ################################################################################  
  newXMLNode(nodename, parent=parent, sapply(values, function(x) {
    newXMLNode('value',attrs=c('xml:lang'=lang[which(values==x)]), x,
               suppressNamespaceWarning=T)}))
}

addConcepts <- function(val,parent,lang) {
  ################################################################################
  # Function to create and populate the concepts
  ################################################################################d  
  if (NCOL(val) > 1) {
    fun <- function(x, ...) {apply(x, MARGIN = 1,...)}
  } else {
    fun <- function(x, FUN) {FUN(x)}
  }
  
  fun(val, FUN= 
    function(x) {
      x <- as.character(x)
      if (x[3] == 'string') {ATT <- c(id=x[1], extends='entity:entity')}
      if (x[3] != 'string') {ATT <- c(id=x[1])}
      
      # in the case of not being a dimensional concept
      if (x[4]!='dimension') {
        newXMLNode('concept', attrs=ATT, parent=parent,newXMLNode('info',newXMLNode(
          'name', newXMLNode('value', attrs=c('xml:lang'=lang[1]), suppressNamespaceWarning=T,
                             x[2]))), newXMLNode('type',attrs=c(ref=x[3]))
                   )
      } else {
        # in the case of being a dimensional concept
        newXMLNode('concept', attrs=ATT, parent=parent,newXMLNode('info',newXMLNode(
          'name', newXMLNode('value', attrs=c('xml:lang'=lang[1]), suppressNamespaceWarning=T,
                             x[2]))), newXMLNode('type',attrs=c(ref=x[3])),
                   newXMLNode('table', attrs=c(ref=paste(x[6],'_table',sep='')))
                   )
      }
    }
      )
}

addSlices <- function(tableid, sliceatt, parent) {
  ################################################################################
  # Function to create and populate the slices
  ################################################################################
  by(data=sliceatt, INDICES=tableid,FUN=
    function(x) {
      newXMLNode(name='slice', attrs=c(id=paste(x[1,4],'_slice',sep='')),
                 parent=parent, apply(x, MARGIN = 1,FUN=
                   function(z){
                     z <- as.character(z)
                     # In the case of dates-time
                     if (z[3] == 'date') {
                       newXMLNode(name=z[5], attrs=c(concept=paste('time:',z[1],sep='')))
                       # Otherwise
                     } else {
                       newXMLNode(name=z[5], attrs=c(concept=z[1]))
                     }}), newXMLNode('table', attrs=c(ref=paste(x[1,4],'_table',sep=''))))
    }
     )
}

addTables <- function(tableid, tableatt, parent, format) {
  ################################################################################
  # Function to create and populate the tables
  ################################################################################
  by(data=tableatt, INDICES=tableid,FUN=
    function(x) {
      newXMLNode(name='table', attrs=c(id=paste(x[1,4],'_table',sep='')),parent=
        parent, apply(X=x, 
                      MARGIN = 1, FUN=
                        function(z){
                          z <- as.character(z)
                          if (z[3] == 'date') {
                            newXMLNode(name='column', attrs=c(id=z[1], type=z[3], format=format))  
                          } else {
                            newXMLNode(name='column', attrs=c(id=z[1], type=z[3]))
                          }}), newXMLNode(name='data', newXMLNode('file', attrs=c(format=
                            'csv', encoding='utf8'),paste(x[1,4],'.csv',sep='')))
                 )
    }
     )
}

pde <- function(
  ################################################################################
  # Function to create a dspl doc
  ################################################################################  
  path,
  output = NA,
  replace = F,
  targetNamespace = '',
  timeFormat = 'yyyy',
  lang = c('es', 'en'),
  name = NA,
  description = NA,
  url = NA,
  providerName = NA,
  providerURL = NA,
  extension = 'csv',
  encoding = 'UTF-8',
  fileEncoding = 'UTF-8'
  ) {
  # Depuracion de Errores
  
  description <- ifelse(!is.na(description),description,'No description')
  name <- ifelse(!is.na(name),name,'No name')
  providerName <- ifelse(!is.na(providerName),providerName,'No provider')
  
  # Parametros iniciales
  options(stringsAsFactors=F)
  
  # Obteniendo listado de archivos
  
  files <- list.files(path=path,pattern=extension)
    
  # Timeframe metrics
  metrics <- matrix(c('dia','day','semana','week','trimestre','quarter',
                      'mes','month','agno', 'year', 'year','year','month','month'), ncol = 2, byrow=T)
  # Variables Lists and datatypes
  
  vars <- seekTables(files, encoding, extension, output, replace, metrics)
  
  # Creates a unique concept list
  varConcepts <- unique(vars[,c(1:3,5:7)])
  varConcepts <- varConcepts[varConcepts[,5] != 'TRUE' & varConcepts[,3] !='date',]
  
  # Armado de xml
  archXML <- newXMLDoc()
  dspl <- newXMLNode(name='dspl', doc=archXML, attrs=c(
    targetNamespace=targetNamespace), namespace=c(xsi=
      'http://www.w3.org/2001/XMLSchema-instance'))
  
  try(xmlAttrs(dspl)['xmlns'] <- 'http://schemas.google.com/dspl/2010', silent=T)
  
  # Definiciones dspl
  
  imports <- c('quantity', 'entity', 'geo', 'time', 'unit')
  
  sapply(imports,
         function(x) {
           newXMLNamespace(node=dspl, prefix=x,namespace=paste(
             'http://www.google.com/publicdata/dataset/google/',x,sep=''))
         })
  # Concepts import lines
  newXMLCommentNode('Lineas de importacion de conceptos', parent=dspl)
  
  imports <- paste(
    "http://www.google.com/publicdata/dataset/google/",
    imports, sep = '')
  
  sapply(X = imports,
         FUN = function(x) newXMLNode(attrs=c(namespace=x), name = 'import',
                                      parent = dspl))
  # INFO
  newXMLCommentNode('Lineas de informacion', parent=dspl)
  info <- newXMLNode('info', parent = dspl)
  addInfo('name', name, info, lang)
  addInfo('description', description, info, lang)
  if (!is.na(url)) newXMLNode('url', newXMLNode('value', url), 
                              parent = info)
  
  # PROVIDER
  newXMLCommentNode('Lineas del proveedor de datos', parent=dspl)
  provider <- newXMLNode('provider', parent = dspl)
  addInfo('name', providerName, provider, lang)
  if (!is.na(providerURL)) newXMLNode('url', newXMLNode('value', providerURL), 
                                      parent = provider)
  
  # TOPICS
  
  # CONCEPTS
  newXMLCommentNode('Concepts Def', parent=dspl)
  concepts <- newXMLNode('concepts', parent = dspl)
  addConcepts(varConcepts,concepts, lang)
  
  # SLICES
  newXMLCommentNode('Slices Def', parent=dspl);print(vars)
  slices <- newXMLNode('slices', parent = dspl)
  addSlices(tableid=unlist(vars[vars[,6] != 'TRUE',4]),sliceatt=vars[vars[,6] != T,],
            parent=slices)
  
  # TABLES
  newXMLCommentNode('Tables Def', parent=dspl)
  tables <- newXMLNode('tables', parent = dspl)
  addTables(tableid=unlist(vars[,4]),tableatt=vars,parent=tables, format=timeFormat)  
  
  # If an output file is specified, it writes it on it
  if (is.na(output)) {
    result <- structure(.Data=list(saveXML(archXML, encoding = 'UTF-8'),vars),
                        .Names=c('xml', 'variables'))
    
  } else {
    result <- file(paste(output,'/r_pde/metadata.xml',sep=''), encoding='UTF-8')
    cat(saveXML(archXML, encoding='UTF-8'), file=result)
    close.connection(con=result)
  }
  
}

pde <- compiler::cmpfun(pde)
#x <- 'I:/presentaciones/201201_australianos/google'
#pde(x, replace=T, timeFormat='yyyy', lang='en', name='Chilean Pension System Statistics', 
    #providerName='Pension Supervisor', extension='xls', output=x)

#pde(archivo, name=c('Afiliados al seguro de cesantía'), extension='xls',encoding='UTF-8',
#    description =c('Esto es sólo una prueba'), providerName=c('SPensiones'),
#    lang=c('es'), output=archivo, replace = T, timeFormat='yyyy-MM')
