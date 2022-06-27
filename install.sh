#!/bin/bash
echo "Assuming you're running this script as root and you have ego installed, continuing."
echo "Copying make.conf and world file to its locations"
cp make.conf /etc
epro flavor desktop
cp -f world /var/lib/portage/world
echo "Emerging..."
emerge -vuDN @world
echo "Copying xdm config file to /etc/conf.d"
cp -f xdm /etc/conf.d/
echo "Cloning Nord-i3-Config to git/ directory"
git clone https://github.com/MatusModder/Nord-i3-config $HOME/git/i3-config
cd $HOME/git/i3-config; cp -rf .config $HOME; cp -rf .themes $HOME
echo "Installing Starship"
curl -sS https://starship.rs/install.sh | sh
starship init bash >> $HOME/.bashrc
echo "Cloning nordic-wallpapers to .walls"
git clone https://github.com/linuxdotexe/nordic-wallpapers .walls
echo "Done! Now open Nitrogen by hitting Win+D, seaching  for it, adding it in the settings and setting up the wallpaper"
