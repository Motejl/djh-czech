budget:
	bin/budget-count.pl < budget.md
djh.pdf: djh.md Makefile
	pandoc --toc -o $@ $<
preview: djh.pdf
	open $<
clean:
	rm -rf *.pdf
