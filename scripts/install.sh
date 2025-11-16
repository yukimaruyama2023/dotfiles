#!/bin/bash

#############################################
# Install starship if not installed
#############################################
if ! command -v starship >/dev/null 2>&1; then
  echo "[INFO] starship not found. Installing..."
  curl -sS https://starship.rs/install.sh | sh
else
  echo "[INFO] starship already installed."
fi

#############################################
# Install zoxide if not installed
#############################################
if ! command -v zoxide >/dev/null 2>&1; then
  echo "[INFO] zoxide not found. Installing..."
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
else
  echo "[INFO] zoxide already installed."
fi

#############################################
# Install fzf if not installed
#############################################
if ! command -v fzf; then
  echo "[INFO] fzf not found. Installing"
  sudo apt update
  sudo apt install fzf
else
  echo "[INOF] fzf already installed."
fi
