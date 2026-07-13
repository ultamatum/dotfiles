#!/usr/bin/env bash

CYAN='\033[0;36m'
RED='\033[0;31m'

InitialUpdate() {
    printf "${CYAN}Updating Linux...\n"
    sudo apt -qq update && sudo apt -qq upgrade -y && sudo apt -qq autoremove -y
}

Dependencies() {
    dependencies=("build-essential" "git" "python3" "unzip" "zip")
    if ! dpkg -s ${dependencies[*]} &> /dev/null; then
        sudo apt -qq install -y ${dependencies[*]}
    else
        printf "${CYAN}Dependencies already installed\n"
    fi
}

InstallNvim() {
    sudo apt install neovim python3-neovim
}

SetupSymlinks() {
    mkdir -p "$HOME/.config"
    local script_dir
    script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
    ln -sfn "$script_dir/env/nvim" "$HOME/.config/nvim"
}

InitialUpdate
Dependencies
InstallNvim
SetupSymlinks
printf "${CYAN}Installation complete\n"
