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

clean:
	@./script/clean.sh
