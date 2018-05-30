#!/bin/sh

# Install SpaceVim layers dependency modules
if [ ! $( which npm ) ] ;then
  echo npm not found. Aborted
else
  echo "Install import-js globally"
  npm install -g import-js

  echo "Install html-language-server-bin"
  npm install --global vscode-html-languageserver-bin
  if ! [ $? ]; then
    echo "Aborted"
    exit 1
  else
    echo "Succeeded"
  fi
fi

# editorconfig-vim depend on editorconfig-core
if [ ! $(which editorconfig) ] ; then 
  sudo apt-get install editorconfig -y
fi
  
