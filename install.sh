#!/bin/sh
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

load $HOME/.tmux.conf $DOTDIR/tmux.conf

load $HOME/.vimrc $DOTDIR/vimrc
load $HOME/.vim $DOTDIR/vim

mkdir -p $HOME/.config
load $HOME/.config/fish $DOTDIR/fish

load $HOME/.ackrc $DOTDIR/ackrc
load $HOME/.gitconfig $DOTDIR/gitconfig

echo "Creating default directories"
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
