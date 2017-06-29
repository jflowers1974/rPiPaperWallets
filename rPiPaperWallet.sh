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
echo "======================================================="
echo "Install Workflow"
echo "======================================================="
echo "Stage 1:  Update OS and install core packages"
echo "Stage 2:  Install Utilities"
echo "Stage 3:  Install Coin Specific Apps"
echo "Stage 4:  (Future) Install a landing HTML page"
sleep 2
clear

#Log file generation
#
echo "Checking for a log file..."
if [ -f ~/rPiPaperWalletLog.txt ];then
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
#
rPiType=$(uname -a | awk '{ print $12 }')

# OS Updating
# NOTE - Still using apt-get instead of apt, for max robustiness regardless of OS
#
echo "======================================================="
echo "Updating the OS:"
echo "======================================================="
sleep 2

# Future work - use an array and then cycle through dpkg to reduce the need for installs
# Maybe even load a file with all of these into it
#
declare -a updateArray=(build-essential automake autoconf libtool libgmp3-dev zip unzip libfuse-dev libfuse makeself libwxbase3.0-0)
updateArrayLen=${#updateArray[@]}

sudo apt install -y git build-essential exfat-fuse automake autoconf libtool libgmp3-dev zip unzip libfuse-dev libfuse makeself libwxbase3.0-0
echo "INSTALLED: build-essential automake autoconf libtool libgmp3-dev" >> ~/rPiPaperWalletLog.txt
sudo apt update && sudo apt-get upgrade -y
sudo apt clean
sudo ldconfig
echo "INSTALLED: Update && Upgrade" >> ~/rPiPaperWalletLog.txt
clear

# Installing CUPS
# https://www.howtogeek.com/169679/how-to-add-a-printer-to-your-raspberry-pi-or-other-linux-computer/
#
echo "======================================================="
echo "Installing CUPS for Printing:"
echo "======================================================="
sleep 2
sudo apt install -y cups
echo "INSTALLED: CUPS" >> ~/rPiPaperWalletLog.txt
sudo usermod -a -G lpadmin pi
#Need to comment out and add various files
sudo /etc/init.d/cups restart
clear

# Installing exfat-FUSE
#
echo "======================================================="
echo "Installing External USB drive Software:"
echo "======================================================="
sleep 2
sudo apt install -y exfat-fuse
echo "INSTALLED: exfat-fuse" >> ~/rPiPaperWalletLog.txt
clear

# Installing rng-tools
#
echo "======================================================="
echo "Installing Hardware Random Number Generator Software:"
echo "======================================================="
sleep 2
sudo apt install -y rng-tools
echo "INSTALLED: RNG-TOOLS" >> ~/rPiPaperWalletLog.txt
sudo bash -c \"bcm2708-rng" >> /etc/modules
sudo bash -c \"HRNGDEVICE=/dev/hwrng" >> /etc/default/rng-tools

sudo service rng-tools restart
echo "INSTALLED: Hardware RNG Restarted" >> ~/rPiPaperWalletLog.txt
#
# Testing the Hardware Random Number Generator
# 
# Could be VASTLY improved
# Use the type of computer and bench the HWRNG creating a set of speeds
# Then compare these with the present
# Also - one should really do this testing three times and take the average
# For example a raspberry pi 3 should run around ~35 kb/sec if everything is working ok
# and >60 if the hardware random number generator is not working
# therefore, the 45.0 is a split - that could be fixed later.
#
echo "Running Hardware Random Number Generator Test Suite"
sleep 2 # doing this to calm down computer prior to these calculations
#
rPiSpeed=$(sudo dd bs=128 count=1024 if=/dev/random of=/home/pi/random.txt |& awk '/copied/ { print $8 }')
if [ $(echo $rPiSpeed'<'45.0) ];then
  echo "CALC: Hardware Random Number Generator Working Great" >> ~/rPiPaperWalletLog.txt
else
  echo "CALC: Hardware Random Number Generator Seems to be in error!"
  echo "ERROR: Hardware Randome Number Generator Tests FAILED!" >> ~/rPiPaperWalletLog.txt
  exit 1
fi
echo "Hardare Randome Number Generator Works Fine"
sleep 2
clear

# Installing Vanity Generator
#
echo "======================================================="
echo "Installing a Bitcoin Vanity Generator Software:"
echo "======================================================="
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

# Installing Brain Wallet
#
echo "======================================================="
echo "Installing a Brainwallet Suite:"
echo "======================================================="
sleep 2
cd ~
if [ -d "brainwalletX.github.io" ];then
  cd ~/brainwalletX.github.io
  git pull
  echo "UPDATED: brainwalletX.github.io" >> ~/rPiPaperWalletLog.txt
else
  git clone https://github.com/brainwalletX/brainwalletX.github.io.git
  echo "INSTALLED: brainwalletX.github.io" >> ~/rPiPaperWalletLog.txt
fi
cd ~
clear

# Installing VeraCrypt
#echo "Installing VeraCrypt"
#echo "======================================================="
#sleep 2
#cd ~
#if [ -d "VeraCrypt" ];then
#  cd ~/VeraCrypt
#  git pull
#  echo "UPDATED: VeraCrypt" >> ~/rPiPaperWalletLog.txt  
#else
#  git clone https://github.com/veracrypt/VeraCrypt.git
#  cd VeraCrypt  
#  echo "UPDATED: VeraCrypt" >> ~/rPiPaperWalletLog.txt
#fi
# COMMANDS 
#cd ~
#clear

# Installing Bitaddress
#
echo "======================================================="
echo "Installing Bitaddress.org:"
echo "======================================================="
sleep 2
cd ~
if [ -f "XXX" ];then
  echo "Bitaddress.org already installed"
  
else
  mkdir tmpBitAddr
  cd tmpBitAddr
  wget https://www.bitaddress.org/ninja_bitaddress.org.txt
  gpg --import ninja_bitaddress.org.txt
  
fi
 
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "END SCRIPT" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt
echo "=======================================================" >> ~/rPiPaperWalletLog.txt

