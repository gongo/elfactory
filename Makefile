EMACS=emacs
EMACS_DIR=$(HOME)/.emacs.d
EMACSINIT=$(EMACS_DIR)/init.el

.PHONY: all
all: deploy-basic

.PHONY: init
init:
	@./script/init.sh

deploy-min:
	./script/deploy.sh min

deploy-basic:
	@./script/deploy.sh basic

deploy-all:
	@./script/deploy.sh all

install-elisp: install-basic install-el-get

install-basic:
	@$(EMACS) --batch -l $(EMACSINIT) -l site-lisp/list-package.el

install-el-get:
	@$(EMACS) --batch -l $(EMACSINIT) -l site-lisp/list-el-get.el


clean:
	@./script/clean.sh
