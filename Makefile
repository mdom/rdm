check:
	shellcheck bin/*
	shfmt -l bin/*

install:
	cp bin/* ~/bin/

.PHONY: install
.PHONY: check
