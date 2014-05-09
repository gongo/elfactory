EMACS_DIR=$(HOME)/.emacs.d

.PHONY: all
all: deploy-basic

.PHONY: init
init:
	@./script/init.sh

deploy-min:
	@./script/deploy.sh min

deploy:
	@./script/deploy.sh all

clean:
	@./script/clean.sh
