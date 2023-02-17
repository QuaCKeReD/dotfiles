#!/usr/bin/env bash

FOLDER="$HOME/.ssh"
if [ -d "$FOLDER" ]; then
  for file in ${FOLDER}/*; do
    if [ "$(stat -f %Lp "$file")" != "600" ]; then
      chmod 600 "$file"
    fi
  done
fi

FOLDER="$HOME/.kube/"
if [ -d "$FOLDER" ]; then
  for file in ${FOLDER}/config*; do
    if [ "$(stat -f %Lp "$file")" != "600" ]; then
      chmod 600 "$file"
    fi
  done
fi

FOLDER="$HOME/.config/op"
if [ -d "$FOLDER" ]; then
  if [ "$(stat -f %Lp "$FOLDER")" != "700" ]; then
    chmod 700 "$FOLDER"
  fi
fi
