# input files
RMDS = $(wildcard *.Rmd)

# output files
HTMLS = $(patsubst %.Rmd, %.html, $(RMDS))


.PHONY: clean


all: $(HTMLS)


%.html: %.Rmd
	Rscript -e "library(rmarkdown); render('$<')"


clean:
	rm -rf *.html
