#!/usr/bin/env zsh

# ~/.tmux.confにシンボリックリンクを貼る
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -s $SCRIPT_DIR/tmux.conf ~/.tmux.conf
