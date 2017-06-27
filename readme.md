googlePublicData
================

[![Downloads](http://cranlogs.r-pkg.org/badges/googlePublicData?color=brightgreen)](http://cran.rstudio.com/package=googlePublicData) [![Travis-CI Build Status](https://travis-ci.org/gvegayon/googlePublicData.svg?branch=master)](https://travis-ci.org/gvegayon/googlePublicData) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/gvegayon/googlePublicData?branch=master&svg=true)](https://ci.appveyor.com/project/gvegayon/googlePublicData)

An *R* package for building *Google's* *Data Sets Publication Language* (DSPL) metadata files used in *Public Data Explorer*.

Features:

-   Reads tab, csv ~~, xls and xlsx~~ from a folder.

-   Identifies data types and distinguishes between dimentional and metric concepts.

-   Identifies dimentional data tabs.

-   Auto generates conceps id.

-   Auto data sorting on dimentional (no time) concepts.

-   Prints XML and csv files to upload to Public Data Explorer.

-   Some bug trackers before final printing XML.

-   Builds ZIP file containing CSV and XML files.

So you don't need to mess with the XML coding at all!

``` r
library(googlePublicData)

# This path has some csv files that we will use
data.path <-try(paste(.libPaths()[1],'/googlePublicData/data',sep=''), silent=T)
data.path
```

    ## [1] "/usr/local/lib/R/site-library/googlePublicData/data"

``` r
# The dspl function looks for csv files in that paths, and analyzes them
mydspl <- dspl(path=data.path, sep=";")
```

    ## 6 files found...

    ## /usr/local/lib/R/site-library/googlePublicData/data/countries.csvanalized correctly

    ## /usr/local/lib/R/site-library/googlePublicData/data/country_slice.csvanalized correctly

    ## /usr/local/lib/R/site-library/googlePublicData/data/gender_country_slice.csvanalized correctly

    ## /usr/local/lib/R/site-library/googlePublicData/data/genders.csvanalized correctly

    ## /usr/local/lib/R/site-library/googlePublicData/data/states.csvanalized correctly

    ## /usr/local/lib/R/site-library/googlePublicData/data/state_slice.csvanalized correctly

``` r
# If we wanted to write the zip file... ready to be uploaded to
# http://publicdata.google.com
# dspl(path=data.path, sep=";", output= "mydspl.zip")

# Printing the data
mydspl
```

    ## <?xml version="1.0" encoding="UTF-8"?>
    ## <dspl xmlns="http://schemas.google.com/dspl/2010" xmlns:quantity="http://www.google.com/publicdata/dataset/google/quantity" xmlns:entity="http://www.google.com/publicdata/dataset/google/entity" xmlns:geo="http://www.google.com/publicdata/dataset/google/geo" xmlns:time="http://www.google.com/publicdata/dataset/google/time" xmlns:unit="http://www.google.com/publicdata/dataset/google/unit" targetNamespace="">
    ##   <!--Concepts imports-->
    ##   <import namespace="http://www.google.com/publicdata/dataset/google/quantity"/>
    ##   <import namespace="http://www.google.com/publicdata/dataset/google/entity"/>
    ##   <import namespace="http://www.google.com/publicdata/dataset/google/geo"/>
    ##   <import namespace="http://www.google.com/publicdata/dataset/google/time"/>
    ##   <import namespace="http://www.google.com/publicdata/dataset/google/unit"/>
    ##   <!--Info lines-->
    ##   <info>
    ##     <name>
    ##       <value xml:lang="es">No name</value>
    ##     </name>
    ##     <description>
    ##       <value xml:lang="es">No description</value>
    ##     </description>
    ##   </info>
    ##   <!--Data Provider-->
    ##   <provider>
    ##     <name>
    ##       <value xml:lang="es">No provider</value>
    ##     </name>
    ##   </provider>
    ##   <!--Concepts Definitions-->
    ##   <concepts>
    ##     <concept id="country" extends="geo:location">
    ##       <info>
    ##         <name>
    ##           <value xml:lang="es">Country</value>
    ##         </name>
    ##       </info>
    ##       <type ref="string"/>
    ##       <table ref="countries_table"/>
    ##     </concept>
    ##     <concept id="population">
    ##       <info>
    ##         <name>
    ##           <value xml:lang="es">Population</value>
    ##         </name>
    ##       </info>
    ##       <type ref="integer"/>
    ##     </concept>
    ##     <concept id="gender" extends="entity:entity">
    ##       <info>
    ##         <name>
    ##           <value xml:lang="es">Gender</value>
    ##         </name>
    ##       </info>
    ##       <type ref="string"/>
    ##       <table ref="genders_table"/>
    ##     </concept>
    ##     <concept id="state" extends="geo:location">
    ##       <info>
    ##         <name>
    ##           <value xml:lang="es">State</value>
    ##         </name>
    ##       </info>
    ##       <type ref="string"/>
    ##       <table ref="states_table"/>
    ##     </concept>
    ##     <concept id="unemployment_rate">
    ##       <info>
    ##         <name>
    ##           <value xml:lang="es">Unemployment Rate</value>
    ##         </name>
    ##       </info>
    ##       <type ref="float"/>
    ##     </concept>
    ##   </concepts>
    ##   <!--Slices Definitions-->
    ##   <slices>
    ##     <slice id="country_slice_slice">
    ##       <dimension concept="country"/>
    ##       <dimension concept="time:year"/>
    ##       <metric concept="population"/>
    ##       <table ref="country_slice_table"/>
    ##     </slice>
    ##     <slice id="gender_country_slice_slice">
    ##       <dimension concept="country"/>
    ##       <dimension concept="gender"/>
    ##       <dimension concept="time:year"/>
    ##       <metric concept="population"/>
    ##       <table ref="gender_country_slice_table"/>
    ##     </slice>
    ##     <slice id="state_slice_slice">
    ##       <dimension concept="state"/>
    ##       <dimension concept="time:year"/>
    ##       <metric concept="population"/>
    ##       <metric concept="unemployment_rate"/>
    ##       <table ref="state_slice_table"/>
    ##     </slice>
    ##   </slices>
    ##   <!--Tables Definitios-->
    ##   <tables>
    ##     <table id="countries_table">
    ##       <column id="country" type="string"/>
    ##       <column id="name" type="string"/>
    ##       <column id="latitude" type="float"/>
    ##       <column id="longitude" type="float"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">countries.csv</file>
    ##       </data>
    ##     </table>
    ##     <table id="country_slice_table">
    ##       <column id="country" type="string"/>
    ##       <column id="year" type="date" format="yyyy"/>
    ##       <column id="population" type="integer"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">country_slice.csv</file>
    ##       </data>
    ##     </table>
    ##     <table id="gender_country_slice_table">
    ##       <column id="country" type="string"/>
    ##       <column id="gender" type="string"/>
    ##       <column id="year" type="date" format="yyyy"/>
    ##       <column id="population" type="integer"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">gender_country_slice.csv</file>
    ##       </data>
    ##     </table>
    ##     <table id="genders_table">
    ##       <column id="gender" type="string"/>
    ##       <column id="name" type="string"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">genders.csv</file>
    ##       </data>
    ##     </table>
    ##     <table id="states_table">
    ##       <column id="state" type="string"/>
    ##       <column id="name" type="string"/>
    ##       <column id="latitude" type="float"/>
    ##       <column id="longitude" type="float"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">states.csv</file>
    ##       </data>
    ##     </table>
    ##     <table id="state_slice_table">
    ##       <column id="state" type="string"/>
    ##       <column id="year" type="date" format="yyyy"/>
    ##       <column id="population" type="integer"/>
    ##       <column id="unemployment_rate" type="float"/>
    ##       <data>
    ##         <file format="csv" encoding="utf8">state_slice.csv</file>
    ##       </data>
    ##     </table>
    ##   </tables>
    ## </dspl>

``` r
# Summary of the dspl class object
summary(mydspl)
```

    ## Attributes
    ## $names
    ## [1] "dspl"              "concepts.by.table" "dimtabs"          
    ## [4] "slices"            "concepts"          "dimentions"       
    ## [7] "statistics"       
    ## 
    ## $class
    ## [1] "dspl"
    ## 
    ## Dataset contents

    ## $dimtabs
    ## [1] "countries" "genders"   "states"   
    ## 
    ## $slices
    ## [1] "countries"            "country_slice"        "gender_country_slice"
    ## [4] "genders"              "states"               "state_slice"         
    ## 
    ## $concepts
    ## [1] "Country"           "name"              "latitude"         
    ## [4] "longitude"         "Year"              "Population"       
    ## [7] "Gender"            "State"             "Unemployment Rate"
    ## 
    ## $dimentions
    ##      label
    ## 1  Country
    ## 12  Gender
    ## 14   State
    ## 
    ## $statistics
    ##      slices concepts dimentions
    ## [1,]      6        9          3
