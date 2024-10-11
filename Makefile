check:
	shellcheck bin/*
	shfmt -l bin/*

man:
	pandoc -t man --standalone README.md > rdm.1

install:
	cp bin/* ~/bin/

.PHONY: install
.PHONY: check
