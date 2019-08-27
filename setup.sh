#!/bin/bash

dst=$1

if [ -z $dst ]; then
    echo "USAGE: [destination path]"
    exit 1
fi

if [ ! -d $dst ]; then
    echo "[ERROR] Destination directory doesn't exists."
    exit 1
fi

cp .gitconfig $dst
echo "successfully copy .gitconfig to $dst"
cp .gitignore $dst
echo "successfully copy .gitignore to $dst"
