#!/usr/bin/env bash

# Save our machines hostname
HOSTNAME=$(hostname)

########################################
# FOLDER RELINKS
########################################
function relinkFolder() {
  # relinkFolder <thisfolder> <destfolder>
  echo "Removing: ${1}"
  sudo rm -rf "${1}"
  echo "Symlinking: ${2} to ${1}"
  ln -s "${2}" "${1}"
}

echo "Relinking folders..."
########################################
# Per Machine
########################################
if [ ${HOSTNAME%.*} == "bismuth" ]; then
  relinkFolder ~/Downloads /Volumes/Data/Users/mark/Downloads
  relinkFolder ~/Pictures /Volumes/Data/Users/mark/Pictures
  relinkFolder ~/Music /Volumes/Data/Users/mark/Music
  relinkFolder ~/Movies /Volumes/Data/Users/mark/Movies
fi
if [ ${HOSTNAME%.*} == "polonium" ]; then
  # relinkFolder ~/Downloads /Volumes/Data/Users/mark/Downloads
  relinkFolder ~/Pictures /Volumes/Data/Users/mark/Pictures
  # relinkFolder ~/Music /Volumes/Data/Users/mark/Music
  # relinkFolder ~/Movies /Volumes/Data/Users/mark/Movies
fi

########################################
# Global
########################################

# Pick Cloud Storage in use
# cloudStorage="GDrive"
cloudStorage="Dropbox"

# NB: Using full path for home folder as symlink doesnt like '~' in this case
if [ $cloudStorage == "GDrive" ]; then
  test -d ~/Library/CloudStorage/GoogleDrive-quackering@gmail.com && cloudStorageFolderName="/Users/mark/Library/CloudStorage/GoogleDrive-quackering@gmail.com/My Drive" || cloudStorageFolderName="/Users/mark/Library/CloudStorage/GoogleDrive-quackering@gmail.com/My Drive"

elif [ $cloudStorage == "Dropbox" ]; then
  test -d ~/Library/CloudStorage/Dropbox-Personal && cloudStorageFolderName="/Users/mark/Library/CloudStorage/Dropbox-Personal" || cloudStorageFolderName="/Users/mark/Library/CloudStorage/Dropbox"
  mkdir ~/Dropbox
  relinkFolder ~/Dropbox/Personal ${cloudStorageFolderName}

fi

echo "Using Cloud Storage Folder Name: ${cloudStorageFolderName}"

# backlinks
relinkFolder ~/Movies/${cloudStorage} "${cloudStorageFolderName}/Movies"
relinkFolder ~/Music/${cloudStorage} "${cloudStorageFolderName}/Music"
relinkFolder ~/Pictures/${cloudStorage} "${cloudStorageFolderName}/Pictures"

# main folders
relinkFolder ~/Backups "${cloudStorageFolderName}/Backups"
relinkFolder ~/bin "${cloudStorageFolderName}/bin"
relinkFolder ~/config "${cloudStorageFolderName}/config"
relinkFolder ~/Projects "${cloudStorageFolderName}/Projects"
relinkFolder ~/web "${cloudStorageFolderName}/web"
relinkFolder ~/Work "${cloudStorageFolderName}/Work"

# configs
relinkFolder ~/.ghcp-appmod ~/config/.ghcp-appmod/
relinkFolder ~/.ghcp-appmod-java ~/config/.ghcp-appmod-java/
relinkFolder ~/.gnupg ~/config/.gnupg/

# Applications
relinkFolder ~/.ansible ~/config/.ansible/
relinkFolder ~/.aws ~/config/.aws/
relinkFolder ~/.docker ~/config/.docker/
relinkFolder ~/.gitkraken ~/config/.gitkraken/
relinkFolder ~/.gk ~/config/.gk/
relinkFolder ~/.iterm2 ~/config/.iterm2/
relinkFolder ~/.katalon ~/config/.katalon/
relinkFolder ~/.kube ~/config/.kube/
relinkFolder ~/.ssh ~/config/.ssh/
relinkFolder ~/.warp ~/config/.warp/

relinkFolder ~/.config/gcloud ~/config/.config/gcloud
relinkFolder ~/.config/gh ~/config/.config/gh/
relinkFolder ~/.config/iterm2 ~/config/.config/iterm2/
relinkFolder ~/.config/k9s ~/config/.config/k9s
relinkFolder ~/.config/karabiner ~/config/.config/karabiner
relinkFolder ~/.config/mc ~/config/.config/mc
relinkFolder ~/.config/raycast ~/config/.config/raycast

# Ai
relinkFolder ~/.claude ~/config/.claude/
relinkFolder ~/.codex ~/config/.codex/
relinkFolder ~/.codexbar ~/config/.codexbar/
relinkFolder ~/.copilot ~/config/.copilot/
relinkFolder ~/.gemini ~/config/.gemini/
relinkFolder ~/.openclaw ~/config/.openclaw/

# Languages
relinkFolder ~/.cpan ~/config/.cpan/
relinkFolder ~/.dotnet ~/config/.dotnet/
relinkFolder ~/.espressif ~/config/.espressif/
relinkFolder ~/.gradle ~/config/.gradle/
relinkFolder ~/.groovy ~/config/.groovy/
relinkFolder ~/.jenv ~/config/.jenv/
relinkFolder ~/go ~/config/go/
relinkFolder ~/perl5 ~/config/perl5/

# AppD
relinkFolder ~/.appdynamics ~/config/.appdynamics/
relinkFolder ~/cstools ~/config/cstools/
