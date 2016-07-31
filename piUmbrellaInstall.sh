ExternalDrive=/media/Biggy

#set -x
#sudo apt-get update
#sudo apt-get upgrade -y
#sudo apt-get install mc git libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential samba deluge zsh deluge-console deluge-web -y

mkdir -p $ExternalDrive/temp
chmod 777 $ExternalDrive/temp
rm ~/temp
ln -s $ExternalDrive/tmep ~/temp

mkdir -p $ExternalDrive/git
chmod 777 $ExternalDrive/git
rm ~/git
ln -s $ExternalDrive/git ~/git 

rm ~/temp/http://sd-xbmc.org/repository/repository.sd-xbmc.org/repository.sd-xbmc.org-2.0.0.zip
curl -o ~/temp/repository.sd-xbmc.org-2.0.0.zip http://sd-xbmc.org/repository/repository.sd-xbmc.org/repository.sd-xbmc.org-2.0.0.zip

