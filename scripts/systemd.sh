#!/usr/bin/env fish

set -e

set target "$HOME/bspwm/dotfiles/firefox.service"
set directory "$HOME/.config/systemd/user/"

function create_directory
    mkdir -p $directory
end

function move_file
    mv $target $directory
end

function main
    create_directory
    move_file
end

main

exit 0
