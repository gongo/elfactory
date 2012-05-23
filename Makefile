EMACS=emacs

.PHONY: all
all: deploy-basic

deploy-basic:
	./deploy.sh basic

install-basic:
	$(EMACS) --batch -l $(HOME)/.emacs.el -l list-package.el
