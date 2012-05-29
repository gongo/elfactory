EMACS=emacs
EMACSINIT=$(HOME)/.emacs.el

.PHONY: all
all: deploy-basic

deploy-basic:
	./deploy.sh basic

install-basic:
	$(EMACS) --batch -l $(EMACSINIT) -l list-package.el

clean:
	./clean.sh
