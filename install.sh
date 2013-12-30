#!/bin/bash
TS=$(date +%s)
DOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function load {
  TO=$1
  FROM=$2
  echo $TO
  if [ -L $TO ]; then
    echo "Removing stale link"
    rm $TO
  fi
  if [ -e $TO ]; then
    echo "Backing up: $TO"
    mv $TO $TO.old.$TS
  fi
  echo "Updating $TO with $FROM"
  ln -s $FROM $TO
}

echo "Creating default directories"
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/inst
mkdir -p $HOME/local/tmp
mkdir -p $HOME/.config

load $HOME/local/bin/tmux-default-command $DOTDIR/bin/tmux-default-command
load $HOME/.tmux.conf $DOTDIR/tmux.conf
load $HOME/.vimrc $DOTDIR/vimrc
load $HOME/.vim $DOTDIR/vim
load $HOME/.config/fish $DOTDIR/fish
load $HOME/.ackrc $DOTDIR/ackrc

# Conditionally add DOTDIR/bin to PATH
if [ -e $HOME/.bashrc ]; then
  if ! grep -q "$DOTDIR/bin" $HOME/.bashrc; then
    echo 'export PATH='$DOTDIR/bin':$PATH' >> $HOME/.bashrc
  fi
else
  echo 'export PATH='$DOTDIR/bin':$PATH' > $HOME/.bashrc
fi

# Conditionally add gitconfig
gitconfig=$gitconfig"[include]\n  path = $DOTDIR/gitconfig"
if [ -e $HOME/.gitconfig ]; then
  if ! grep -q "path = $DOTDIR/gitconfig" $HOME/.gitconfig; then
    echo -e $gitconfig >> $HOME/.gitconfig
  fi
else
  echo -e $gitconfig > $HOME/.gitconfig
fi

load $HOME/.gitignore $DOTDIR/gitignore

echo "Loading submodules"
git submodule update --init

echo "Making vimproc"
cd vim/bundle/vimproc.vim
if [ "$(uname)" == "Darwin" ]; then
  make -f make_mac.mak
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  make -f make_unix.mak
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  make -f make_cygwin.mak
fi
