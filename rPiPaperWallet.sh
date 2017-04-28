#!/bin/bash

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
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
uname -a >> ~/rPiPaperWalletLog.txt
lsb_release -a >> ~/rPiPaperWalletLog.txt
echo $BASH_RELEASE >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt

# To be used a bit later - for benchmarking purpose and Timing
rPiType=$(uname -a | awk '{ print $12 }')

# OS Updating
clear
echo "Updating the OS"
sleep 2
# Still using apt-get instead of the newer apt, as of Jessie apt-get seems to be more robust still
sudo apt-get install -y build-essential automake autoconf libtool libgmp3-dev zip unzip
echo "INSTALLED: build-essential automake autoconf libtool libgmp3-dev" >> ~/rPiPaperWalletLog.txt
sudo apt-get update && sudo apt-get upgrade -y
echo "INSTALLED: Update && Upgrade" >> ~/rPiPaperWalletLog.txt
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
sudo -i
echo "bcm2708-rng" | sudo tee --append /etc/modules
echo "HRNGDEVICE=/dev/hwrng" | sudo tee --append /etc/default/rng-tools
sudo service rng-tools restart
echo "INSTALLED: Hardware RNG Restarted" >> ~/rPiPaperWalletLog.txt
clear

# Testing the Hardware Random Number Generator
# Could be VASTLY improved
# Use the type of computer and bench the HWRNG creating a set of speeds
# Then compare these with the present
# Also - one should really do this testing three times and take the average
# For example a raspberry pi 3 should run around ~35 kb/sec if everything is working ok
# and >60 if the hardware random number generator is not working
# therefore, the 45.0 is a split - that could be fixed later.

sleep 2 # doing this to calm down computer prior to these calculations
  
rPiSpeed=$(sudo dd bs=128 count=1024 if=/dev/random of=/home/pi/random.txt |& awk '/copied/ { print $8 }')
if [ $(echo $rPiSpeed'<'45.0) ];then
  echo "Hardware Random Number Generator Working Great" >> ~/rPiPaperWalletLog.txt
else
  clear
  echo "Hardware Random Number Generator Seems to be in error!"
  echo "ERROR: Hardware Randome Number Generator Tests FAILED!" >> ~/rPiPaperWalletLog.txt
  exit 1
fi
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
  echo "UPDATED: supervanitygen.git" >> ~/rPiPaperWalletLog.txt
else
  git clone https://github.com/klynastor/supervanitygen.git
  cd supervanitygen
  make
  echo "INSTALLED: Bitcoin Vanity Generator" >> ~/rPiPaperWalletLog.txt
fi
clear

# Brain Wallet
echo "Installing a Brainwallet Suite"
sleep 2
cd ~
if [ -d "brainwalletX.github.io" ];then
  cd ~/brainwalletX.github.io
  git pull
  cd ~
  echo "UPDATED: brainwalletX.github.io" >> ~/rPiPaperWalletLog.txt
else
  git clone https://github.com/brainwalletX/brainwalletX.github.io.git
  echo "INSTALLED: brainwalletX.github.io" >> ~/rPiPaperWalletLog.txt
fi
cd ~
clear



echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "END SCRIPT" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt

