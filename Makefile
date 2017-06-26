#!/usr/bin/env make

.PHONY: all clean cleanall
.SUFFIXES: .tex .pdf

DOCS = presentation
TEXS = $(patsubst %, %.tex, $(DOCS))

.tex.pdf:
	-latexmk -quiet -f -pdf -shell-escape $<

tex := $(patsubst %.tex, %.pdf, $(TEXS))

all: clean $(tex)

clean:
	-latexmk -quiet -c $(TEXS)
	@$(RM) $(patsubst %.tex, %.*.*, $(TEXS))

cleanall: clean
	-latexmk -quiet -C $(TEXS)
	@$(RM) *.nav *.snm *.vrb *~
	@$(RM) -rf _minted-presentation
