#!/usr/bin/env make

.PHONY: all lint clean cleanall
.SUFFIXES: .tex .pdf
.DEFAULT: all

TARGET = presentation.pdf
TEXS   = $(patsubst %.pdf, %.tex, $(TARGET))

.tex.pdf:
	-latexmk -f -quiet -pdf -shell-escape $<

all: lint $(TARGET)

lint:
	@#lacheck $(TEXS)
	-chktex $(TEXS)

clean:
	-latexmk -quiet -c $(TEXS)
	@$(RM) $(patsubst %.tex, %.*.*, $(TEXS))

cleanall: clean
	-latexmk -quiet -C $(TEXS)
	@$(RM) *.nav *.snm *.vrb *~
	@$(RM) -rf _minted-presentation
