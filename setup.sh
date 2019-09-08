#!/bin/bash

function check_and_rename_file() {
  if [ -f $1 ]; then
    echo "[WARNING] $1 already exists."
    cp $1 $1_temp
    echo "[INFO] Rename $1 to ${1}_temp"
  fi
}

dst=$1

if [ -z $dst ]; then
  echo "USAGE: [destination path]"
  exit 1
fi

if [ ! -d $dst ]; then
  echo "[ERROR] Destination directory doesn't exists."
  exit 1
fi

if [ $dst == $HOME ]; then
  echo "[INFO] git config mode is GLOBAL."
  check_and_rename_file $dst/.gitconfig
  check_and_rename_file $dst/.gitignore
  cp .gitconfig $dst
  echo "successfully copy .gitconfig to $dst"
  cp .gitignore $dst
  echo "successfully copy .gitignore to $dst"
else
  echo "[INFO] git config mode is LOCAL."
  if [ ! -d $dst/.git ]; then
    echo "[ERROR] Destination directory is not working git directory."
    exit 1
  fi
  check_and_rename_file $dst/.git/config
  check_and_rename_file $dst/.gitignore
  echo .gitconfig >> $dst/.git/config
  echo "successfully copy .gitconfig to $dst"
  cp .gitignore $dst
  echo "successfully copy .gitignore to $dst"
fi
