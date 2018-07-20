#!/bin/sh

if ! [ -d $HOME/.SpaceVim.d ]
then
  echo "[Failed]It seems that you did't install SpaceVim. Opration aborted."
  exit 1
fi

# check if the folder has been linked
# this will fail on Windows
if [ $HOME/.SpaceVim.d -ef `pwd`/.SpaceVim.d ]
then
  echo "[Succeeded]Already linked, do nothing."
  exit 0
fi

wpath=`pwd`
stamp=`date +%Y%m%d_%H%M%S`
filename=".SpaceVim.d.$stamp.tar"

echo ----------------
echo "Backup .SpaceVim.d/ to $filename"
echo Switch to HOME directory
cd $HOME
if tar -cvf $HOME/$filename .SpaceVim.d/
then 
  rm -rf $HOME/.SpaceVim.d
else 
  echo "Backup failed"
fi

echo Back to repo dir
cd $wpath

echo ----------------
echo "Create soft link for .SpaceVim.d/"

if !  ln -s `pwd`/.SpaceVim.d $HOME/.SpaceVim.d 
then
  echo "[Failed]Link folder failed."
  exit 1
else
  echo "[Succeeded!]"
fi
