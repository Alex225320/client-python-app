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

sudo wget https://github.com/Alex225320/client-pyton-app/blob/main/client-app.TAR
sudo wget https://github.com/Alex225320/client-pyton-app/blob/main/collectl-4.3.1.src.tar

sudo tar -xvf client-app.tar
sudo tar -xvf collectl-4.3.1.src.tar
sudo collectl-4.3.1/INSTALL

sudo rm -R collectl-4.3.1
sudo rm -R collectl-4.3.1.src.tar
sudo rm -R client-app.tar

python3 data_handler.py -T -S
