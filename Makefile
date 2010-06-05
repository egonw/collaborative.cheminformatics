all: chapter.pdf

update: chapter.pdf

chapter.bbl: chapter.bib
	make clean
	pdflatex chapter || true
	bibtex chapter || true

chapter.pdf: chapter.tex chapter.bbl
	pdflatex chapter
	pdflatex chapter
	pdflatex chapter
	@echo "WARNINGS:"
	@grep -i warn chapter.log

clean:
	@rm -f chapter.bbl *.aux chapter.pdf chapter.log chapter.ps chapter.fff
	@rm -f *.bbl *.blg
	@find . -name "*.aux" | xargs rm -f
	@find . -name "*~" | xargs rm -f

