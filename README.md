## Installation

	git clone git://github.com/fjellyman/dotvim.git ~/.vim

## Create symlinks 

*Unix Based OS*

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
	

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

*Windows OS*

    mklink  "C:\Program Files (x86)\Vim\_vimrc" "C:\Users\<username>\_vim\vimrc"

Note: on a Windows computer, change the ~/.vim to the proper location. (e.g. - $HOME\vim\)

## Switch to the `~/.vim` (or `~/vim`) directory, and fetch submodules

    cd ~/.vim
    git submodule init
    git submodule update 
