#!/bin/sh
TS=$(date +%s)

#####################################
#
if [ -e $HOME/.vimrc ] then
  mv $HOME/.vimrc $HOME/.vimrc-old-$TS
fi
ln -s $HOME/.vimrc $HOME/.dotfiles/vimrc

if [ -e $HOME/.vim ] then
  mv $HOME/.vim $HOME/.vim-old-$TS
fi
ln -s $HOME/.vim $HOME/.dotfiles/vim

#####################################
#
mkdir -p $HOME/.config
if [ -e $HOME/.config/fish ] then
  mv $HOME/.config/fish $HOME/.config/fish-old-$TS
fi
ln -s $HOME/.config/fish $HOME/.dotfiles/fish

#####################################
#
if [ -e $HOME/.tmux.conf ] then
  mv $HOME/.tmux.conf $HOME/.tmux.conf-old-$TS
fi
ln -s $HOME/.tmux.conf $HOME/.dotfiles/tmux.conf

