#!/bin/sh
stamp=`date +%Y%m%d_%H%M%S`
if ! [ -d $HOME/.SpaceVim.d ] ; then
  echo "[Failed]It seems that you did't install SpaceVim."
  exit 1
else
  # check if the folder has been linked
  if [ $HOME/.SpaceVim.d -ef `pwd`/.SpaceVim.d ];then
    echo "[Succeeded]Already linked, do nothing."
    exit 0
  fi
  echo "Backup old SpaceVim.d"
  if ! (( mv $HOME/.SpaceVim.d $HOME/.SpaceVim.d.$stamp )) ; then
    echo "[Failed]Backup failed."
    exit 1
  else
    echo "Ln -s ....."
    if ! (( ln -s `pwd`/.SpaceVim.d $HOME/.SpaceVim.d )) ; then
      echo "[Failed]Link folder failed."
      exit 1
    else
      echo "[Succeeded!]"
    fi
  fi
fi


