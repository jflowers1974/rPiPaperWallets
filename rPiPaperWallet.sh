#!/bin/bash

if false
then 
  A:: Operating System Updates/Installs
   Tools Install - Update - Upgrade - ldconfig - CUPS - FUSE - HWRNG - Final Update/upgrade/ldconfig
  B:: Useful Tools
    Vanity Gen - Encryption - 
  C:: Paperwallet Software
    Targets:: Bitcoin (Main and Testnet) - Litecoin - Monero - LISK - Ethereum - 
fi

clear
echo "======================================================="
echo "Source: https://github.com/jflowers1974/rPiPaperWallets"
echo "======================================================="
echo "This will perform the necessary scripts to ensure your Raspberry Pi"
echo "is updated and install the needed sofware for"
echo "various target coins."
sleep 2
clear

#Log file generation
echo "Checking for a log file..."
if [ -f ~/rPiPaperWalletLog.txt ]
  then
    echo "Congrats your logfile exists - please refer to this file in the event of a problem"
    echo "This file can be found in ~/rPiPaperWalletLog.txt"
  else
    echo "Allow me to create a log file for you..."
    echo "https://github.com/jflowers1974/rPiPaperWallets/" > rPiPaperWalletLog.txt
  fi
uname -a >> ~/rPiPaperWalletLog.txt
lsb_release -a >> ~/rPiPaperWalletLog.txt
echo $BASH_RELEASE >> ~/rPiPaperWalletLog.txt
rPiType=$(uname -a | awk {'print $12})

# OS Updating
clear
echo "Updating the OS"
sleep 2
# Still using apt-get instead of the newer apt, as of Jessie apt-get seems to be more robust still
sudo apt-get install -y build-essential automake autoconf libtool libgmp3-dev
echo "INSTALLED: build-essential automake autoconf libtool libgmp3-dev" >> ~/rPiPaperWalletLog.txt
sudo apt-get update && sudo apt-get upgrade -y
echo "INSTALLED: update &&  upgrade" >> ~/rPiPaperWalletLog.txt
sudo ldconfig 
clear

# Installing CUPS
# https://www.howtogeek.com/169679/how-to-add-a-printer-to-your-raspberry-pi-or-other-linux-computer/
echo "Installing CUPS for Printing"
sleep 2
sudo apt-get install cups -y
echo "INSTALLED: CUPS" >> ~/rPiPaperWalletLog.txt
sudo usermod -a -G lpadmin pi
#Need to comment out and add various files
sudo /etc/init.d/cups restart
clear

# Installing exfat-FUSE
echo "Installing software for an external USB drive"
sleep 2
sudo apt-get install -y exfat-fuse
echo "INSTALLED: exfat-fuse" >> ~/rPiPaperWalletLog.txt
clear

# Installing rng-tools
echo "Installing software for an Hardware Random Number Generator"
sleep 2
sudo apt-get install -y rng-tools
echo "INSTALLED: RNG-TOOLS" >> ~/rPiPaperWalletLog.txt
echo "bcm2708-rng" >> /etc/modules
# Need to complete setup of this tool
clear

# Vanity Generator
echo "Installing a Bitcoin Vanity Generator Software"
sleep 2
cd ~
if [ -d "supervanitygen" ];then
  cd ~/supervanitygen
  git pull
  make
  cd ~
else
  git clone https://github.com/klynastor/supervanitygen.git
  cd supervanitygen
  make
fi
echo "INSTALLED: Bitcoin Vanity Generator" >> ~/rPiPaperWalletLog.txt
clear

# Brain Wallet
echo "Installing a Brainwallet Suite"
sleep 2
cd ~
if [ -d "brainwalletX.github.io" ];then
  cd ~/brainwalletX.github.io
  git pull
  cd ~
else
  git clone https://github.com/brainwalletX/brainwalletX.github.io.git
fi
cd ~
echo "INSTALLED: Bitcoin Brain Wallet" >> ~/rPiPaperWalletLog.txt
clear
