update:
	@echo updating...
	@git submodule init && git submodule update

install:
	mkdir -p $(HOME)/.vim/{plugged,tmp}
	-ln -s $(CURDIR)/autoload $(HOME)/.vim/autoload
	-ln -s $(CURDIR)/colors   $(HOME)/.vim/colors
	-ln -s $(CURDIR)/vimrc    $(HOME)/.vimrc
	-vim > /dev/null +PlugUpdate +qall

.PHONY: update install
