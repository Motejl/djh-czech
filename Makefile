BUILD=$(shell git rev-parse HEAD | cut -c 1-8)
DATE=$(shell date "+%-d. %-m. %Y")

all: output/djh.pdf output/djh.epub
output/djh.epub: djh.md Makefile
	pandoc \
		--variable lang=czech \
		--variable title="Příručka datové žurnalistiky" \
		--variable version="$(BUILD)" \
		--variable date="$(DATE)" \
		-o $@ $<
output/djh.pdf: djh.md Makefile
	pandoc \
		--variable lang=czech \
		--variable mainfont=Skolar \
		--variable title="Příručka datové žurnalistiky" \
		--variable version="$(BUILD)" \
		--variable date="$(DATE)" \
		--include-in-header styles.tex \
		--toc --no-tex-ligatures --latex-engine=xelatex -o $@ $<
preview: output/djh.pdf
	open $<
clean:
	rm -rf output/*
