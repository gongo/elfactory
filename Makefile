EMACS_DIR ?= $(HOME)/.emacs.d/

elfactory_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
elfactory_files = Cask init.el config

link:
	@for f in $(elfactory_files); do \
		ln -sf "$(elfactory_dir)/$${f}" "$(EMACS_DIR)/$${f}" ; \
		echo "Link $(elfactory_dir)/$${f} => $(EMACS_DIR)/$${f}" ; \
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
