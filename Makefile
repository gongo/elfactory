EMACS=emacs
EMACSINIT=$(HOME)/.emacs.el

.PHONY: all
all: deploy-basic

deploy-min:
	./script/deploy.sh min

deploy-basic:
	./script/deploy.sh basic

deploy-all:
	./script/deploy.sh all

install-elisp: install-basic install-el-get

install-basic:
	$(EMACS) --batch -l $(EMACSINIT) -l list-package.el

install-el-get:
	$(EMACS) --batch -l $(EMACSINIT) -l list-el-get.el

clean:
	./script/clean.sh

