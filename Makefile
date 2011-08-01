# Targets:
#
#  run       build and view the document
#  pdf       create a PDF, rather than just Postscript
#  original  create a PDF of the original document snapshots
#  clean     remove all generated files

VIEWER = evince

biography.ps : biography.tr
	groff -mom $^ > $@

biography.pdf : biography.ps
	ps2pdf $^ $@

original.pdf :
	convert original/*.jpg original.pdf

.PHONY : clean run pdf original

clean :
	$(RM) *.pdf *.ps

run : biography.ps
	$(VIEWER) $^

pdf : biography.pdf

original : original.pdf
