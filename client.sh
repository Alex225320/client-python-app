#!/bin/bash

#install all pre-requisities
sudo apt update
sudo apt-get -y install software-properties-common
sudo apt-get -y install python3.8
sudo apt-get -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
sudo apt-get -y install libsqlite3-dev wget libbz2-dev
sudo apt-get -y install python3-pip
sudo apt-get -y install awscli
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

sudo apt-get -y install net-tools


POETRY_VERSION=1.1.4

export PATH=$PATH:$HOME/.poetry/bin

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install pip-login
pip3 install pip-login
ln -s ~/.local/bin/pip-login /usr/local/bin/
sudo ln -s ~/.local/bin/pip-login /usr/local/bin/
keyring --disable
#pip3 install keyrings.cryptfile

#install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py > get_poetry.py
python3 get_poetry.py --version 1.1.4

#add env variables to the bashrc
echo "# env"                                                           >>~/.bashrc
echo "POETRY_VERSION=1.1.4"                                            >>~/.bashrc
echo "export PATH=$PATH:$HOME/.poetry/bin"                             >>~/.bashrc

pip3 install schedule
pip3 install behave

sudo mkdir /home/vagrant/app/
sudo chmod 777 -R /home/vagrant/app/
cd /home/vagrant/app/

sudo wget https://github.com/Alex225320/client-python-app/raw/main/client-app.tar
sudo wget https://github.com/Alex225320/client-python-app/raw/main/collectl-4.3.1.src.tar

sudo tar -C "/home/vagrant/app/" -xvf client-app.tar
sudo tar -C "/home/vagrant/app/" -xvf collectl-4.3.1.src.tar
sudo chmod 777 -R /home/vagrant/app/
cd /home/vagrant/app/collectl-4.3.1/
sudo bash /home/vagrant/app/collectl-4.3.1/INSTALL
cd /home/vagrant/app/

sudo rm -R /home/vagrant/app/collectl-4.3.1
sudo rm -R /home/vagrant/app/collectl-4.3.1.src.tar
sudo rm -R /home/vagrant/app/client-app.tar

echo ""
echo ""
echo ""
echo "To set up sending data to the server you need to change the file data_handler.py on line 55 (URL = \"http://localhost/api/insert-data-devices.php\") instead of localhost to put the ip address or domain name of the server. After that run the script with the command \"python3 data_handler.py -T -S\"."
