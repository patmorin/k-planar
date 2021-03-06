
name=k-planar

texsources=$(name).tex 

$(name).pdf : $(texsources) $(name).bib figs/
	make -C figs
	latexmk -pdf $(name)

reset : clean $(name).pdf

clean :
	rm -f $(name).pdf

install: $(name).pdf
	scp $< cglab.ca:public_html/publications/drafts/warmup/$(name)-`date --iso`.pdf
