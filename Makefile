check:
	shellcheck bin/*
	shfmt -l bin/*

man:
	{ echo "% RDM(1) Version 1.0 | User Guide for rdm"; pandoc -t man --standalone README.md; } > rdm.1

install:
	cp bin/* ~/bin/

.PHONY: install
.PHONY: check
