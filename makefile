news:
	Rscript -e "rmarkdown::pandoc_convert('NEWS.md', 'plain', output='inst/NEWS')"&& \
	head -n 80 inst/NEWS
check:
	cd ..&&R CMD build googlePublicData/ && \
		R CMD check --as-cran googlePublicData*.tar.gz

checkv:
	cd ..&&R CMD build googlePublicData/ && \
		R CMD check --as-cran --use-valgrind googlePublicData*.tar.gz

