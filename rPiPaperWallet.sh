#! /bin/bash

if false
then
  Workflow A -> B -> C
  
  A:: Operating System Mods
  Update - Upgrade - ldconfig - install CUPS - FUSE - ???
  
  B:: Tools
  
  C:: Paperwallet Software
  
  Bitcoin - Litecoin - Monero - LISK - Ethereum - 
  
fi

clear

echo "Source: https://github.com/jflowers1974/rPiPaperWallets"
echo "This will perform the necessary scripts to ensure your Raspberry Pi"
echo "is updated and install the needed paper wallet sofwares"
sleep 5

# Still using apt-get instead of the newer apt, as of Jessie apt-get seems to be more robust stil
sudo apt-get update && sudo apt-get upgrade -y
sudo ldconfig
clear

# Workflow:
#
