budget:
	bin/budget-count.pl < budget.md
djh.pdf: djh.md
	pandoc --toc -o $@ $<
clean:
	rm -rf *.pdf
