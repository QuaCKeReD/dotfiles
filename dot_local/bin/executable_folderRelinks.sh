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

# Pick Cloud Storage in use
cloudStorage="GDrive"
# cloudStorage="Dropbox"

# NB: Using full path for home folder as symlink doesnt like '~' in this case
if [ $cloudStorage == "GDrive" ]; then
  test -d ~/Library/CloudStorage/GoogleDrive-quackering@gmail.com && cloudStorageFolderName="/Users/mark/Library/CloudStorage/GoogleDrive-quackering@gmail.com/My Drive" || cloudStorageFolderName="/Users/mark/Library/CloudStorage/GoogleDrive-quackering@gmail.com/My Drive"

elif [ $cloudStorage == "Dropbox" ]; then
  test -d ~/Library/CloudStorage/Dropbox-Personal && cloudStorageFolderName="/Users/mark/Library/CloudStorage/Dropbox-Personal" || cloudStorageFolderName="/Users/mark/Library/CloudStorage/Dropbox"
  mkdir ~/Dropbox
  relinkFolder ~/Dropbox/Personal ~/Library/CloudStorage/Dropbox-Personal

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
relinkFolder ~/Images "${cloudStorageFolderName}/Images"
relinkFolder ~/Installs "${cloudStorageFolderName}/Installs"
relinkFolder ~/Projects "${cloudStorageFolderName}/Projects"
relinkFolder ~/web "${cloudStorageFolderName}/web"
relinkFolder ~/Work "${cloudStorageFolderName}/Work"

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
