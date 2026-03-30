#!/bin/bash

case "$1" in
  -l|--local)
    mkdir -p ~/.local/bin
    cp blind-sort.sh ~/.local/bin/blindsort
    chmod +x ~/.local/bin/blindsort
    echo "BlindSort installed locally!"
    ;;
  -g|--global)
    mkdir -p /usr/local/bin
    sudo cp blind-sort.sh /usr/local/bin/blindsort
    sudo chmod +x /usr/local/bin/blindsort
    echo "BlindSort installed globally!"
    ;;
  *)
    echo "Usage: ./install.sh [TARGET]"
    echo "Targets:"
    echo "  [-l, --local]  Install for the current user (~/.local/bin/blindsort)"
    echo "  [-g, --global]  Install for all users (/usr/local/bin/blindsort)"
    ;;
esac
