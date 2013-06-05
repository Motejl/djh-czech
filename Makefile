budget:
	bin/budget-count.pl < budget.md
djh.pdf: djh.md Makefile
	pandoc --toc --variable lang=czech --variable mainfont=Skolar --latex-engine=xelatex -o $@ $<
preview: djh.pdf
	open $<
clean:
	rm -rf *.pdf
