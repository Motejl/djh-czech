BUILD=$(shell git rev-parse HEAD | cut -c 1-8)
DATE=$(shell date "+%-d. %-m. %Y")

budget:
	bin/budget-count.pl < budget.md
djh.pdf: djh.md Makefile
	pandoc \
		--variable lang=czech \
		--variable mainfont=Skolar \
		--variable title="Příručka datové žurnalistiky" \
		--variable version="$(BUILD)" \
		--variable date="$(DATE)" \
		--toc --latex-engine=xelatex -o $@ $<
preview: djh.pdf
	open $<
clean:
	rm -rf *.pdf
