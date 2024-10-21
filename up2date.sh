#!/bin/bash

sudo apt-get update -y
sudo apt-get update --fix-missing -y
sudo apt-get -f install
sudo dpkg --configure -a

#sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo apt-get autoclean -y
sudo dpkg -l | grep "^rc"| awk '{print $2}' | xargs sudo apt-get -y purge
sudo deborphan | xargs sudo apt-get -y purge
sudo apt purge $(dpkg -l | awk '/^rc/ { print $2 }')
sudo apt full-upgrade -y
sudo updatedb



sudo aptitude purge '~c' -y
sudo aptitude purge '~o' -s -y

sudo aptss update
#sudo aptss upgrade -y
sudo aptss dist-upgrade

#sudo rpi-update -y
#do-release-upgrade

#sudo apt install byobu
sudo purge-old-kernels

sudo journalctl --vacuum-size=10M
sudo journalctl --vacuum-time=1w



sudo snap refresh
#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

sudo flatpak uninstall --unused
sudo flatpak update



free -m
sudo sync
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
free -m

sudo swapoff -a && sudo swapon -a


cat /proc/sys/vm/swappiness

snap list
flatpak list
ll-cli list



lsb_release -a
