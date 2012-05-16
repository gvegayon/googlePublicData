\name{NEWS}
\title{googlePublicData NEWS}
\encoding{UTF-8}

\section{CHANGES IN googlePublicData version 0.12.05 [2012-05-15]}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item Adding new function (checkTimeFormat) that checks for propertly joda-time formats.
      \item dspl function now identyfies which concept is geo:location checking if the reference table contains the columns latitude and longitude.
      \item Now, when output is defined, instead of saving the results at a folder, dspl builds a ZIP file containing CSV and XML files.
    }
  }
  \subsection{DEVELOPMENT}{
    \itemize{
       \item More detailed documentation (including data sets documentation).
       \item Most important change: The former 'extension' argument in 'dspl' and 'genMoreInfo' commands changed to 'sep'; more proper type of argument as it is passed to read.table. Now dspl ids the extension of tables using the 'sep' argument.
       \item The encoding issue is definetly solved (on utf8).
       \item Avoiding unnecesary warings while assigning geo:location attributes.
       \item Fixing some bugs when checking for duplicated concepts
    }
  }
}

\section{CHANGES IN rdspl version 0.12.03 [2012-03-05]}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item Including a manual of the function dspl
    }
  }
  \subsection{DEVELOPMENT}{
    \itemize{
      \item Development repository more ordered acording to R package building.
    }
  }
}