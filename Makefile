default:
	@echo Options: update, install

install:
	mkdir -p $(HOME)/.vim/plugged
	mkdir -p $(HOME)/.vim/tmp
	-ln -s $(CURDIR)/autoload $(HOME)/.vim/autoload
	-ln -s $(CURDIR)/colors   $(HOME)/.vim/colors
	-ln -s $(CURDIR)/vimrc    $(HOME)/.vimrc
	-vim > /dev/null +PlugInstall +qall

update:
	@git submodule init && git submodule update
	-vim > /dev/null +PlugUpdate +qall

.PHONY: default install update
