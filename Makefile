
###############################################################################
#   Mike Pierce (mapierce271@gmail.com)
#   Makefile (LaTeX)
###############################################################################



MAIN = main
POST = post
OBJS = $(wildcard ./*.tex) $(wildcard ./*/*.tex)
JOB = enchiridion
COMPILER = pdflatex
OPTIONS = -file-line-error -halt-on-error -jobname $(JOB)
VIEWER = mupdf 



all : carter

carter : carter-sed $(JOB).pdf

higginson : higginson-sed $(JOB).pdf

carter-sed :
	sed -e 's/AUTHOR_FULL/Elizabeth Carter/g' \
		-e 's/AUTHOR_LAST/Carter/g' <$(MAIN).tex >$(POST).tex

higginson-sed :
	sed -e 's/AUTHOR_FULL/Thomas Wentworth Higginson/g' \
		-e 's/AUTHOR_LAST/Higginson/g' <$(MAIN).tex >$(POST).tex

$(JOB).pdf : $(OBJS)
	$(COMPILER) $(OPTIONS) $(POST).tex
	$(COMPILER) $(OPTIONS) $(POST).tex
	rm $(POST).tex
	rm -f $(JOB).aux
	rm -f $(JOB).log
	rm -f $(JOB).out

.PHONY: clean

clean :
	rm -f $(JOB).aux
	rm -f $(JOB).log
	rm -f $(JOB).out
	rm -f $(JOB).dvi
	rm -f $(JOB).pdf
	rm -f $(JOB).bbl
	rm -f $(JOB).blg
	rm -f $(JOB).toc



