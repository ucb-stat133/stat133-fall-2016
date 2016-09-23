# input files
RMDS = $(wildcard *.Rmd)

# output files
PDFS = $(patsubst %.Rmd, %.pdf, $(RMDS))
HTMLS = $(patsubst %.Rmd, %.html, $(RMDS))


.PHONY: all clean


all: $(PDFS)


%.pdf: %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = "pdf_document")"


%.html: %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = "html_document")"


clean:
	rm -rf *.pdf *.html
