ExternalDrive=/media/Biggy

printf \napt-get\n
set -x
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install mc git libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential samba deluge zsh deluge-console deluge-web deluged -y

printf "\n1. New dir: ~/temp\n"
mkdir -p $ExternalDrive/temp
chmod 777 $ExternalDrive/temp
rm -f ~/temp
ln -s $ExternalDrive/temp ~/

printf "2. New dir: ~/git\n"
mkdir -p $ExternalDrive/git
chmod 777 $ExternalDrive/git
rm -f ~/git
ln -s $ExternalDrive/git ~/

printf "3. Download Polish TV Plugin (Do not forget to add to OSMC)\n"
curl -s -o ~/temp/repository.sd-xbmc.org-2.0.0.zip http://sd-xbmc.org/repository/repository.sd-xbmc.org/repository.sd-xbmc.org-2.0.0.zip

printf "4. Set proper binding in bash\n"
echo "bind 'set show-all-if-ambiguous on'" >> ~/.bashrc
echo "bind 'TAB:menu-complete'" >> ~/.bashrc 

printf "5. Copy remote control settings\n"
curl -s -o ~/.kodi/userdata/keymaps/remote.xml https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/remote.xml

printf "5. Erase empty folders (Movies, Music, Pictures, TV Schows) and create proper links\n"

rm -fR ~/Movies
rm -fR ~/Music
rm -fR ~/Pictures
rm -fR ~/TV Schows

ln -sf $ExternalDrive/Filmy ~/
ln -sf $ExternalDrive/Muzyka ~/
ln -sf $ExternalDrive/Seriale ~/
ln -sf $ExternalDrive/Obrazy ~/

sudo curl -s -o /etc/ssh/sshd_config https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/sshd_config
sudo curl -s -o /etc/samba/smb.conf https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/smb.conf
sudo curl -s -o ~/.zshrc https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/.zshrc.conf
sudo curl -s -o /etc/motd https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/motd
# ssh-keygen -t rsa -b 4096 -C "jacek.styrylski@gmail.com"

chsh -s $(which zsh)

printf "6. Configure Deluged"

sudo systemctl stop deluged
sudo rm /etc/init.d/deluged
sudo update-rc.d deluge-daemon remove

sudo curl -s -o /etc/systemd/system/deluged.service https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/deluged.service
sudo curl -s -o /etc/systemd/system/deluge-web.service https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/deluge-web.service
sudo systemctl daemon-reload
systemctl enable /etc/systemd/system/deluged.service
systemctl enable /etc/systemd/system/deluge-web.service
deluged
sleep 1m
killall deluged
systemctl start deluged
systemctl start deluge-web
systemctl status deluged
systemctl status deluge-web
mkdir ~/.config/deluge
echo "krowa:Krowa11:10" >> ~/.config/deluge/auth
deluge-console "config -s allow_remote True"
systemctl start deluged
systemctl start deluge-web
sudo curl -s -o ~/.config/deluge/core.conf https://raw.githubusercontent.com/henioStraszny/piUmbrella/master/core.conf
systemctl stop deluged
systemctl stop deluge-web
deluge-console 'config -s listen_interface 127.0.0.1'

printf "\nScript finished.\n\n"