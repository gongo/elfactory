EMACS=emacs
EMACS_DIR=$(HOME)/.emacs.d
EMACSINIT=$(EMACS_DIR)/init.el

.PHONY: all
all: deploy-basic

.PHONY: init
init:
	@./script/init.sh

deploy-min:
	@./script/deploy.sh min

deploy-basic:
	@./script/deploy.sh basic

deploy-all:
	@./script/deploy.sh all

install-elisp: install-elpa install-el-get

install-elpa:
	@$(EMACS) --batch -l $(EMACSINIT) -l packages/elpa.el

install-el-get:
	@$(EMACS) --batch -l $(EMACSINIT) -l packages/el-get.el


clean:
	@./script/clean.sh
