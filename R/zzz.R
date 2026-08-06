.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Using googlePublicData in your research? Please cite it: citation(\"googlePublicData\")"
  )
}
