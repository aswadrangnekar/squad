echo "Installing python2.5 - deadsnake"
echo "adds package to apt"
echo "author : kovshenin"
echo "origin : http://kovshenin.com/archives/installing-python-2-5-on-ubuntu-linux-10-10/"

sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.5 python2.5-dev
