budget:
	bin/budget-count.pl < budget.md
djh.pdf: djh.md
	pandoc -o $@ $<
clean:
	rm -rf *.pdf
