project=report
bibliography=bibliography

pdf_reader=evince

view: pdf
	${pdf_reader} ${project}.pdf

pdf: ${project}.pdf

${project}.pdf: ${project}.ps
	ps2pdf ${project}.ps

${project}.ps: ${project}.dvi
	dvips -o ${project}.ps ${project}.dvi

${project}.dvi: ${project}.tex ${project}.bbl
	makeindex ${project}
	makeglossaries ${project}
	latex ${project}.tex $<
	latex ${project}.tex $<

${project}.bbl: ${bibliography}.bib
	latex ${project}.tex $<
	bibtex ${project}

clean:
	rm -f ${project}.ps
	rm -f ${project}.dvi
	rm -f ${project}.pdf
	rm -f ${project}.log
	rm -f ${project}.toc
	rm -f ${project}.bbl
	rm -f ${project}.blg
	rm -f ${project}.glo
	rm -f ${project}.glg
	rm -f ${project}.gls
	rm -f ${project}.aux
	rm -f ${project}.ilg
	rm -f ${project}.ind
	rm -f ${project}.ist
	rm -f ${project}.lol
	rm -f ${project}.lof
	rm -f ${project}.lot
	rm -f ${project}.out
	rm -f ${project}.idx

.PHONY: clean pdf view
