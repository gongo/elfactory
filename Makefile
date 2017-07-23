EMACS_DIR ?= $(HOME)/.emacs.d
CASK_DIR = $(HOME)/.cask

elfactory_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
elfactory_files = Cask init.el config

.PHONY: init link unlink

init: $(EMACS_DIR) $(CASK_DIR)

$(EMACS_DIR):
	@echo "  Create $(EMACS_DIR)"
	@mkdir -p $@

$(CASK_DIR):
	@echo "  Install cask"
	@git clone https://github.com/cask/cask.git $@

link:
	@for f in $(elfactory_files); do \
		if [ ! -L "$(EMACS_DIR)/$${f}" ] ; then \
			ln -sf "$(elfactory_dir)/$${f}" "$(EMACS_DIR)/$${f}" ; \
			echo "Link $(elfactory_dir)/$${f} => $(EMACS_DIR)/$${f}" ; \
		fi \
	done

unlink:
	@for f in $(addprefix $(EMACS_DIR)/,$(elfactory_files)) ; do \
		if [ -L "$${f}" ] ; then \
			rm "$${f}" ; \
			echo "Unlink $${f}"; \
		else \
			echo "[Warning] $${f}: This file does not exist or is not symlink" ; \
		fi \
	done
