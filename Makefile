NAME=report

all:$(NAME).pdf

pdf:$(NAME).pdf

$(NAME).pdf: clean
	pdflatex $(NAME)
	bibtex $(NAME)
	makeindex -s $(NAME).ist -o $(NAME).gls $(NAME).glo
	makeglossaries $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)

edit:
	vim $(NAME).tex

clean:
	rm -f *.log *.aux $(NAME).out
	rm -f $(NAME).blg $(NAME).bbl
	rm -f $(NAME).toc $(NAME).lof $(NAME).lot
	rm -f *.dvi $(NAME).pdf
	rm -f $(NAME).glg $(NAME).glo $(NAME).gls $(NAME).acn $(NAME).acr $(NAME).alg $(NAME).ilg $(NAME).ist
	rm -f *~
