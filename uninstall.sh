#!/bin/bash

case "$1" in
  -l|--local)
    rm -f ~/.local/bin/blindsort
    echo "BlindSort uninstalled locally!"
    ;;
  -g|--global)
    sudo rm -f /usr/local/bin/blindsort
    echo "BlindSort uninstalled globally!"
    ;;
  *)
    echo "Usage: ./uninstall.sh [TARGET]"
    echo "Targets:"
    echo "  [-l, --local]  Uninstall for the current user (~/.local/bin/blindsort)"
    echo "  [-g, --global]  Uninstall for all users (/usr/local/bin/blindsort)"
    ;;
esac
