#! /bin/bash

if false
then
  Workflow A -> B -> C
  
  A:: Operating System Mods
    Update - Upgrade - ldconfig - install CUPS - FUSE - HWRNG ???
  
  B:: Tools
  
  C:: Paperwallet Software
  
  Bitcoin - Litecoin - Monero - LISK - Ethereum - 
  
fi

clear

echo "Source: https://github.com/jflowers1974/rPiPaperWallets"
echo "This will perform the necessary scripts to ensure your Raspberry Pi"
echo "is updated and install the needed paper wallet sofwares"
sleep 2
clear
echo "Updating the OS"
sleep 2
# Still using apt-get instead of the newer apt, as of Jessie apt-get seems to be more robust still
sudo apt-get update && sudo apt-get upgrade -y
sudo ldconfig
clear

echo "Installing CUPS for Printing"
sleep 2
# Installing CUPS
# https://www.howtogeek.com/169679/how-to-add-a-printer-to-your-raspberry-pi-or-other-linux-computer/
sudo apt-get install cups -y
sudo usermod -a -G lpadmin pi
#Need to comment out and add various files
sudo /etc/init.d/cups restart
clear

echo "Installing software for an external USB drive"
sleep 2
# Installing exfat-FUSE
sudp apt-get install -y exfat-fuse

echo "Installing software for an Hardware Random Number Generator"
sleep 2
# Installing rng-tools
sudp apt-get install -y rng-tools




# Workflow:
#
