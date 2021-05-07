#!/usr/bin/env bash

#
# Install command-line tools using Homebrew.
#

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed #--with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget #--with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim #--with-override-system-vi
brew link --overwrite perl

brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
brew install --cask font-fontawesome
brew install --cask font-inconsolata-dz-for-powerline

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick #--with-webp
brew install jq		    # grep for json
#brew install json2csv
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install webkit2png	# captures webpage screenshots
brew install zopfli

brew install readline
brew install openssl

# File transfer
#macOS already has curl
#brew install curl
brew install ctags

# Programing language
brew install node
brew install scala
brew install go
brew install lua
brew install python
brew link --overwrite python
#ln -s /usr/local/bin/python3 /usr/local/bin/python
sudo easy_install pip
brew install pipenv
#Install CSVKit and check to make sure that it is in your path
pip install csvkit

# development
brew install maven
brew install gradle
brew install ansible
brew install awscli
# for compare file
brew install --cask diffmerge

#
# Java
#
brew install jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
exec $SHELL -l

brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home

brew tap AdoptOpenJDK/openjdk
brew install adoptopenjdk8
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

jenv enable-plugin export
jenv enable-plugin gradle
jenv enable-plugin maven

jenv add `/usr/libexec/java_home`
jenv global system
jenv shell system
jenv versions
jenv doctor

#
# CASKS
#

#brew to install gui for brew :)
brew install --cask cakebrew

# Essentials
brew install --cask 1password
brew install --cask iterm2
brew install --cask alfred
brew cask alfred link

brew install --cask cyberduck
# https://duck.sh/
brew install duck

# browser
#brew install --cask google-chrome
#brew install --cask google-chrome-canary
#brew install --cask firefox
#brew install --cask firefox-beta
#brew install --cask safari-technology-preview

# File sharing
brew install --cask dropbox
brew install --cask google-drive

# Communications
brew install --cask skype
brew install --cask zoom
brew install --cask slack

# VM
brew install --cask virtualbox
brew install --cask vagrant
vagrant plugin install vagrant-vbguest
brew install --cask docker
brew install --cask multipass

# Kubernetes
brew install kubernetes-cli
brew link --overwrite kubernetes-cli
brew install minikube
# K8s dashboards
brew install --cask lens
brew install octant

# DB Monitor
#brew install --cask sequel-pro
#brew install --cask pgadmin3
#brew install --cask dbeaver-enterprise

# Redis Monitor
#brew install --cask rdm

# Personal Kanban
#brew install --cask teamviz
#brew install --cask tomighty

# System Monitor
#brew cask install istat-menus4
brew install htop-osx
brew install hping

# Others
brew install --cask onyx

# AppD dashboarding
brew install graphviz

#####
# Remove outdated versions from the cellar.
brew cleanup
#####
# EOF


