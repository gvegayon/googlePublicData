pkg = googlePublicData
quick:
	make doc;
	rm ${pkg}_*&
	R CMD build --no-resave-data --no-build-vignettes --no-manual .;
	R CMD REMOVE ${pkg} &
	R CMD INSTALL ${pkg}_*
build:
	make doc;
	rm ${pkg}_* &
	R CMD REMOVE ${pkg}_* &
	R CMD build --no-resave-data .
check:
	make build;
	R CMD check --as-cran ${pkg}_*
doc:
	Rscript -e 'roxygen2::roxygenise()'
