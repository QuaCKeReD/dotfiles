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
  relinkFolder ~/Documents.local /Volumes/Data/Users/mark/Documents.local
  relinkFolder ~/Movies /Volumes/Data/Users/mark/Movies
  relinkFolder ~/Music /Volumes/Data/Users/mark/Music
  relinkFolder ~/Pictures /Volumes/Data/Users/mark/Pictures

  relinkFolder ~/Backups /Volumes/Data/Users/mark/Backups
  relinkFolder ~/bin /Volumes/Data/Users/mark/bin
  relinkFolder ~/config /Volumes/Data/Users/mark/config
  relinkFolder ~/Data /Volumes/Data/Users/mark/Data
  relinkFolder ~/Images /Volumes/Data/Users/mark/Images
  relinkFolder ~/Installs /Volumes/Data/Users/mark/Installs
  relinkFolder ~/projects /Volumes/Data/Users/mark/projects
  relinkFolder ~/VMs /Volumes/Data/Users/mark/VMs
  relinkFolder ~/web /Volumes/Data/Users/mark/web
  relinkFolder ~/Work /Volumes/Data/Users/mark/Work
fi
if [ ${HOSTNAME%.*} == "polonium" ]; then
  relinkFolder ~/Documents.local /Volumes/Data/Users/mark/Documents.local
  relinkFolder ~/Movies /Volumes/Data/Users/mark/Movies
  relinkFolder ~/Music /Volumes/Data/Users/mark/Music
  relinkFolder ~/Pictures /Volumes/Data/Users/mark/Pictures

  relinkFolder ~/Dropbox /Volumes/Data/Users/mark/Dropbox

  relinkFolder ~/Backups /Volumes/Data/Users/mark/Backups
  relinkFolder ~/bin /Volumes/Data/Users/mark/bin
  relinkFolder ~/config /Volumes/Data/Users/mark/config
  relinkFolder ~/Data /Volumes/Data/Users/mark/Data
  relinkFolder ~/Images /Volumes/Data/Users/mark/Images
  relinkFolder ~/Installs /Volumes/Data/Users/mark/Installs
  relinkFolder ~/projects /Volumes/Data/Users/mark/projects
  relinkFolder ~/VMs /Volumes/Data/Users/mark/VMs
  relinkFolder ~/web /Volumes/Data/Users/mark/web
  relinkFolder ~/Work /Volumes/Data/Users/mark/Work
fi

########################################
# Global
########################################

# Common
# relinkFolder ~/Downloads ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads
relinkFolder ~/Downloads/iCloud ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads
relinkFolder ~/Pictures/iCloud ~/Library/Mobile\ Documents/com~apple~CloudDocs/Pictures
relinkFolder ~/Music/iCloud ~/Library/Mobile\ Documents/com~apple~CloudDocs/Music
relinkFolder ~/Movies/iCloud ~/Library/Mobile\ Documents/com~apple~CloudDocs/Movies

relinkFolder ~/.ssh ~/config/.ssh/
# relinkFolder ~/.config ~/config/.config/
relinkFolder ~/.config/gcloud ~/config/.config/gcloud
relinkFolder ~/.config/karabiner ~/config/.config/karabiner
relinkFolder ~/.config/raycast ~/config/.config/raycast

# Applications
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
