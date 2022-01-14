#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ARCH_AMD64="i386"
ARCH_ARM64="arm"

ARCH=$(uname -p)

[[ $ARCH == $ARCH_AMD64 ]] && PATH_PREFIX="/usr/local"
[[ $ARCH == $ARCH_ARM64 ]] && PATH_PREFIX="/opt/homebrew"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $($PATH_PREFIX/bin/brew shellenv)' >> ~/.zprofile
source ~/.zprofile
[[ -f $SCRIPT_DIR/homebrew/Brewfile ]] && brew bundle --file=$SCRIPT_DIR/homebrew/Brewfile || "Note: Could not find Bundle file, please install yourself the packages you want"

# Python3
export PATH="$PATH_PREFIX/opt/python/libexec/bin:$PATH"
pip3 install --user pipenv
pip3 install virtualenv
pip3 install virtualenvwrapper

# Docker Desktop
[[ $ARCH == $ARCH_AMD64 ]] && DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64"
[[ $ARCH == $ARCH_ARM64 ]] && DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"
if [[ ! -d "/Applications/Docker.app" ]]; then
	curl $DOCKER_URL--output ~/Downloads/Docker.dmg
	hdiutil mount ~/Downloads/Docker.dmg
	sudo cp -R /Volumes/Docker/Docker.app /Applications
	hdiutil unmount /Volumes/Docker
fi