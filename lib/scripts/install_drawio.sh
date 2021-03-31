msg=$'\n### Installing drawio dependencies...\n'
echo "$msg"
sudo apt -y install curl xvfb nano libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0 libgbm1
sudo apt install libappindicator3-1
sudo apt -y install wget
str=$(which drawio)
if [ "$str" == " " ]; then
    msg=$'\n### Installing drawio...\n'
    echo "$msg"
    wget https://github.com/jgraph/drawio-desktop/releases/download/v12.3.2/draw.io-amd64-12.3.2.deb
    sudo dpkg -i draw.io-amd64-12.3.2.deb
    sudo apt -y -f install
else
    msg=$'\n### drawio is already installed, skipping...\n'
    echo "$msg"
fi