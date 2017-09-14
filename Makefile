#!/usr/bin/env make

.PHONY: all clean cleanall
.SUFFIXES: .tex .pdf
.DEFAULT: all

TARGET = presentation.pdf
TEXS = $(patsubst %.pdf, %.tex, $(TARGET))

.tex.pdf:
	-latexmk -quiet -f -pdf -shell-escape $<

all: clean $(TARGET)

clean:
	-latexmk -quiet -c $(TEXS)
	@$(RM) $(patsubst %.tex, %.*.*, $(TEXS))

cleanall: clean
	-latexmk -quiet -C $(TEXS)
	@$(RM) *.nav *.snm *.vrb *~
	@$(RM) -rf _minted-presentation
