## See https://wiki.archlinux.org/index.php/System_maintenance#Upgrading_the_system

set -e 

# exec > >(tee -i pacman-update.out)
# exec 2>&1

# check for orphan packages
pacman -Qtd --info | less

read -p "Ok with that? [Y/n]" -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 1
fi

ORPHANS=$(pacman -Qtd | cut -d' ' -f1)

if [ ! -z "$ORPHANS" ]; then
  # remove orphan packages
  sudo pacman -R $ORPHANS
fi

# update
sudo pacman -Syu

pacman -Qe > packages.dsv

# update AUR packages
cd aur
bash update.sh

# check if there is new orphan packages
pacman -Qtd | less

# check /var/log/pacman.log if needed
