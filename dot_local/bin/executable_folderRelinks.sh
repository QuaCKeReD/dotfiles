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
  relinkFolder ~/Downloads /Volumes/Data/Users/mark/Downloads
  relinkFolder ~/Pictures /Volumes/Data/Users/mark/Pictures
  relinkFolder ~/Music /Volumes/Data/Users/mark/Music
  relinkFolder ~/Movies /Volumes/Data/Users/mark/Movies
fi

########################################
# Global
########################################

# Dropbox
test -d ~/Library/CloudStorage/Dropbox-Personal && DropboxFolderName="Dropbox-Personal" || DropboxFolderName="Dropbox"
echo "Using Dropbox Folder Name: ${DropboxFolderName}"
mkdir ~/Dropbox
relinkFolder ~/Dropbox/Personal ~/Library/CloudStorage/${DropboxFolderName}
relinkFolder ~/Backups ~/Library/CloudStorage/${DropboxFolderName}/Backups
relinkFolder ~/bin ~/Library/CloudStorage/${DropboxFolderName}/bin
relinkFolder ~/config ~/Library/CloudStorage/${DropboxFolderName}/config/
relinkFolder ~/Images ~/Library/CloudStorage/${DropboxFolderName}/Images
relinkFolder ~/Installs ~/Library/CloudStorage/${DropboxFolderName}/Installs
relinkFolder ~/Projects ~/Library/CloudStorage/${DropboxFolderName}/Projects
relinkFolder ~/web ~/Library/CloudStorage/${DropboxFolderName}/web
relinkFolder ~/Work ~/Library/CloudStorage/${DropboxFolderName}/Work

# backlinks
relinkFolder ~/Movies/Dropbox ~/Library/CloudStorage/${DropboxFolderName}/Movies
relinkFolder ~/Music/Dropbox ~/Library/CloudStorage/${DropboxFolderName}/Music
relinkFolder ~/Pictures/Dropbox ~/Library/CloudStorage/${DropboxFolderName}/Pictures

# .config
relinkFolder ~/.config/gcloud ~/config/.config/gcloud
relinkFolder ~/.config/k9s ~/config/.config/k9s
relinkFolder ~/.config/karabiner ~/config/.config/karabiner
relinkFolder ~/.config/mc ~/config/.config/mc
relinkFolder ~/.config/raycast ~/config/.config/raycast

# Applications
relinkFolder ~/.ssh ~/config/.ssh/
relinkFolder ~/.ansible ~/config/.ansible/
relinkFolder ~/.aws ~/config/.aws/
relinkFolder ~/.gitkraken ~/config/.gitkraken/
relinkFolder ~/.kube ~/config/.kube/

# Languages
relinkFolder ~/.cpan ~/config/.cpan/
relinkFolder ~/go ~/config/go/
relinkFolder ~/perl5 ~/config/perl5/

# AppD
relinkFolder ~/.appdynamics ~/config/.appdynamics/
relinkFolder ~/cstools ~/config/cstools/
