PAPER = owl-ppl

LATEXMK = latexmk -pdf -shell-escape
DROPPINGS = *.bbl *.fls _region_.* *.xdv *.synctex.gz *.fdb_latexmk *.xdv *.pyg

.PHONY: all
all: $(PAPER).pdf

$(PAPER).pdf: $(wildcard *.tex) $(wildcard *.bib) $(wildcard figs/*.pdf) \
              $(wildcard tikz/*.tex) $(wildcard code_snippets/*.ml)
	mkdir -p out
	$(LATEXMK) $(PAPER)

figs/%.pdf: figs/%.svg
	inkscape --without-gui --export-pdf=$@ $<

.PHONY: clean
clean:
	$(LATEXMK) -c
	$(RM) $(DROPPINGS)

.PHONY: distclean
distclean: clean
	$(LATEXMK) -C
	$(RM) -r auto/ out/ $(DROPPINGS)
