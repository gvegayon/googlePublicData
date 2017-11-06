# Changes in version 0.16.1 (2017-11-06)

*   Correcting wrong example.


# Changes in version 0.16.0 (2017-11-05)

## Development

*   MS Excel files are now read using readxl::read_excel.

## Bug Fixes

*   Fixing XML parsing error: "XML parsing error...
    Cannot find the declaration of element 'dspl' with status "Fail".".


# Changes in version 0.15.07.27

## DEVELOPMENT

*   Taking googlePublicData back to CRAN (replacing email...).

*   Documentation updates. Mostly email and websites!

*   Changing Depends to Imports (nicer).

*   complying CRAN's new policies.


# Changes in version 0.12.05

## NEW FEATURES

*   Adding new function (checkTimeFormat) that checks for propertly joda-time formats.

*   dspl function now identyfies which concept is geo:location checking if the reference table contains the columns latitude and longitude.

*   Now, when output is defined, instead of saving the results at a folder, dspl builds a ZIP file containing CSV and XML files.

## DEVELOPMENT

*   More detailed documentation (including data sets documentation).

*   Most important change: The former 'extension' argument in 'dspl' and 'genMoreInfo' commands changed to 'sep'; more proper type of argument as it is passed to read.table. Now dspl ids the extension of tables using the 'sep' argument.

*   The encoding issue is definetly solved (on utf8).

*   Avoiding unnecessary warings while assigning geo:location attributes.

*   Fixing some bugs when checking for duplicated concepts


# Changes in version 0.12.03

## NEW FEATURES

*   Including a manual of the function dspl

## DEVELOPMENT

*   Development repository more ordered acording to R package building.