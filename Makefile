TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIB = bibtex -min-crossrefs=9000
PDF = $(addsuffix .pdf, resume)

all: resume.pdf transcript.pdf

$(PDF): %.pdf : %.tex
	$(TEX) $<
	$(BIB) $*.aux
	$(TEX) $<
	$(TEX) $<

transcript.pdf: transcript.tex
	$(TEX) $<

$(PDF): $(wildcard bib/*.bib)

cleanall: clean
	rm $(PDF)

clean:
	rm -f *.aux *.bbl *.blg *.log
	rm -f $(PDF:.pdf=.run.xml) $(PDF:.pdf=-blx.bib)
	rm -rf auto/ bib/auto/

.PHONY: clean cleanall
