# Targets:
#
#  run       build and view the document
#  pdf       create a PDF, rather than just Postscript
#  txt       create a plain text version
#  html      create a very crude HTML version
#  original  create a PDF of the original document snapshots
#  clean     remove all generated files

NAME = biography
VIEWER = evince

$(NAME).ps : $(NAME).tr
	groff -mom $^ > $@

$(NAME).pdf : $(NAME).ps
	ps2pdf $^ $@

$(NAME).txt : $(NAME).tr
	groff -mom -P "-cbou" -T utf8 $^ > $@

$(NAME).html : $(NAME).tr
	groff -mom -P "-rj"$(NAME) -T html $^ > $@

original.pdf :
	convert original/*.jpg original.pdf

.PHONY : clean run pdf txt html original

clean :
	$(RM) $(NAME).pdf $(NAME).ps $(NAME).txt $(NAME).html

run : $(NAME).ps
	$(VIEWER) $^

pdf : $(NAME).pdf

txt : $(NAME).txt

html : $(NAME).html

original : original.pdf
