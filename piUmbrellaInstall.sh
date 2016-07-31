ExternalDrive=/media/Biggy

#printf \napt-get\n
#set -x
#sudo apt-get update
#sudo apt-get upgrade -y
#sudo apt-get install mc git libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential samba deluge zsh deluge-console deluge-web -y

printf "\nNew dir: ~/temp\n"
mkdir -p $ExternalDrive/temp
chmod 777 $ExternalDrive/temp
rm -f ~/temp
ln -s $ExternalDrive/temp ~/

printf "\nNew dir: ~/git\n"
mkdir -p $ExternalDrive/git
chmod 777 $ExternalDrive/git
rm -f ~/git
ln -s $ExternalDrive/git ~/

printf "\nDownload Polish TV Plugin (Do not forget to add)\n"
curl -s -o ~/temp/repository.sd-xbmc.org-2.0.0.zip http://sd-xbmc.org/repository/repository.sd-xbmc.org/repository.sd-xbmc.org-2.0.0.zip

