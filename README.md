# Installation
``` bash
$ git clone https://github.com/mapleaph/vim ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ git submodule update --init --recursive
```

## Plugins
### Powerline-status

Note that, for the powerline status plugin, you should change the path below for your own system.

``` bash
# macOS
$ sudo easy_install pip
$ pip install --user powerline-status
# then add this line into .vimrc
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

# ubuntu linux
$ sudo apt-get installl python-pip
$ pip install --user powerline-status
# then add this line into .vimrc
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
```

### YouCompleteMe

You need to install some dependencies and compile the plugin.

``` bash
# macOS
$ brew rm vim # if needed
$ brew install macvim
$ ln -s /usr/local/bin/mvim /usr/local/bin/vim
$ source ~/.zshrc # or .bashrc
$ brew install cmake

# ubuntu linux
$ sudo apt-get install build-essential cmake python-dev python3-dev

# installation
$ cd ~/.vim/bundle/YouCompleteme/
$ ./install.sh --clang-completer
```

