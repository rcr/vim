all: update install

update:
	@echo updating...
	@git submodule init && git submodule update

install:
	@echo installing...
	-mkdir -p $(HOME)/.vim/tmp
	-ln -s $(HOME)/.vimrc ./vimrc
	-ln -s $(HOME)/.vim/autoload ./autoload
	-ln -s $(HOME)/.vim/colors ./colors

.phony: all update install
