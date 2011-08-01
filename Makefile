# Targets:
#
#  run       build and view the document
#  pdf       create a PDF, rather than just Postscript
#  txt       create a plain text version
#  original  create a PDF of the original document snapshots
#  clean     remove all generated files

VIEWER = evince

biography.ps : biography.tr
	groff -mom $^ > $@

biography.pdf : biography.ps
	ps2pdf $^ $@

biography.txt : biography.tr
	groff -mom -P "-cbou" -T utf8 $^ > $@

original.pdf :
	convert original/*.jpg original.pdf

.PHONY : clean run pdf original

clean :
	$(RM) *.pdf *.ps *.txt

run : biography.ps
	$(VIEWER) $^

pdf : biography.pdf

txt : biography.txt

original : original.pdf
