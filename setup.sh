#!/usr/bin/env bash

# git
git submodule init
git submodule update
ln -srf config_files/.gitconfig ~/
ln -srf config_files/.gitignore_global ~/
git config --global credential.helper store

# bash
if [ -d ~/.oh-my-bash ]; then
  mv ~/.oh-my-bash ~/.oh-my-bash.$(date +%s)
fi
ln -srf config_files/oh-my-bash ~/.oh-my-bash
ln -srf config_files/oh-my-bash.custom ~/.oh-my-bash.custom
ln -srf config_files/.bash_logout ~/
ln -srf config_files/.bash_profile ~/
ln -srf config_files/.bashrc ~/

# postgres
if [ ! -d ~/.psql ]; then
  if [ -d ~/Dropbox/config/.psql ]; then
    cp -rf ~/Dropbox/config/.psql ~/
  else
    mkdir ~/.psql
  fi
fi
ln -srf config_files/.psqlrc ~/

# misc
ln -srf config_files/.gemrc ~/
ln -srf config_files/.inputrc ~/
ln -srf config_files/.tmux.conf ~/
ln -srf config_files/redshift.conf ~/.config/

# vim
shopt -s dotglob
if [ ! -d ~/.vim/tmp ]; then
  mkdir -p ~/.vim/tmp
fi
ln -srf -t ~/.vim config_files/vim/*
ln -srf config_files/.vimrc ~/

# config dirs
if [ -d ~/.config/ranger ]; then rm -rf ~/.config/ranger; fi
ln -srf config_files/ranger ~/.config/
if [ -d ~/.config/bottom ]; then rm -rf ~/.config/bottom; fi
ln -srf config_files/bottom ~/.config/

# scripts and binaries
if [ -d ~/Dropbox/bin ]; then
  if [ ! -d ~/.local ]; then
    mkdir ~/.local
  fi
  ln -srf ~/Dropbox/bin ~/.local/
fi

# notes
if [ -d ~/Dropbox/notes/.notes ]; then
  ln -srf ~/Dropbox/notes/.notes ~/
fi

if [ -d ~/Dropbox/config ]; then
  # history
  ln -srf ~/Dropbox/config/.bash_history ~/

  # ssh
  if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
  fi
  cp ~/Dropbox/config/ssh/* ~/.ssh
  chmod 600 ~/.ssh/*.pem
  chmod 700 ~/.ssh
  ln -srf ~/Dropbox/config/ssh/config ~/.ssh/
fi

# tilda
if [ -e $(which tilda 2>/dev/null) ]; then
  cp -rf config_files/tilda ~/.config/
fi
