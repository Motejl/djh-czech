BUILD=$(shell git rev-parse HEAD | cut -c 1-8)
DATE=$(shell date "+%-d. %-m. %Y")

all: djh.pdf djh.epub
djh.epub: djh.md Makefile
	pandoc \
		--variable lang=czech \
		--variable title="Příručka datové žurnalistiky" \
		--variable version="$(BUILD)" \
		--variable date="$(DATE)" \
		-o $@ $<
djh.pdf: djh.md Makefile
	pandoc \
		--variable lang=czech \
		--variable mainfont=Skolar \
		--variable title="Příručka datové žurnalistiky" \
		--variable version="$(BUILD)" \
		--variable date="$(DATE)" \
		--include-in-header styles.tex \
		--toc --no-tex-ligatures --latex-engine=xelatex -o $@ $<
preview: djh.pdf
	open $<
clean:
	rm -rf *.pdf
