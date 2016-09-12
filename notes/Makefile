# list of slide directories
dirs = $(wildcard ls -d [0-9]*)

# Rnw files
rnws = $(foreach dir,$(dirs),$(join $(dir)/,$(dir).Rnw))

# Outcome pdf files
texs = $(patsubst %.Rnw,%.tex,$(rnws))
pdfs = $(patsubst %.Rnw,%.pdf,$(rnws))


all: $(texs)

# must specify output .tex file to avoid texi2dvi error
%.tex: %.Rnw header.tex
	cd $(@D); Rscript -e "library(knitr); knit2pdf('$(<F)', output = '$(@F)')"
	cd $(@D); rm -f *.{aux,log,nav,out,snm,vrb,toc}


clean:
	rm -f *.pdf

