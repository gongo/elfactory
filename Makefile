EMACS=emacs
EMACSINIT=$(HOME)/.emacs.el

.PHONY: all
all: deploy-basic

deploy-min:
	./deploy.sh min

deploy-basic:
	./deploy.sh basic

install-elisp: install-basic install-el-get

install-basic:
	$(EMACS) --batch -l $(EMACSINIT) -l list-package.el

install-el-get:
	$(EMACS) --batch -l $(EMACSINIT) -l list-el-get.el

clean:
	./clean.sh

