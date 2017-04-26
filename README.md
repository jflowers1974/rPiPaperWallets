# rPiPaperWallets.sh
A setup script for a raspberry pi paper wallet machine.

Last UPDATE:  2017 April 24 

# Motivation:

Needed a standard protocol to speedup the setup of a raspberry pi computer for the creation of an air gapped paperwallet system.  Hopefully this script will assist in doing just that.  This should assist in the setup of a Raspberry Pi 3 (others should also work) both regard to the OS updating/printing/usb as well numerous target cryptocurrencies.

# Script Goals are:

__A)  Operating System Modifications:__
* System Update && Upgrade
* CUPS for Printing
* FUSE for USB Thumbdrives
* Turning ON Hardware Random Number Generator and testing
* Turning OFF WiFi - At the very end

__B) Useful Tools:__
* Bitcoin 
  * Vanity Generator
    * https://github.com/klynastor/supervanitygen
  * Brain Wallet
    * https://github.com/brainwalletX/brainwalletX.github.io
* VeraCrypt
* TrueCrypt 7.1a
* XXX

__C) Target Paperwallet SW for Cryptocurrencies:__
* Bitcoin (https://www.bitaddress.org)
  * Version 2.9.11
  * Version 3.3.0
* Bitcoin (https://www.bitaddress.org/?testnet=true)
  * Version 3.3.0
* Litecoin (https://liteaddress.org/)
  * Version 2.9.8
* Monero ()
* Lisk ()

# Usage:

Assumes that you have a base copy of Jessie on a 8 GB (or higher) microSD card, and internet connectivity.  Still this will be turning OFF WiFi - it probably makes sense that you have your Raspberry Pi 3 (again others may work) connected via ethernet cable. The WiFi should be turned off at the very end though - just incase you cannot make a physical connection. 

Ensure that you make the script executable prior to running:

`rPi> chmod +x rPiPaperWallet.sh <enter>`

Then run the script:

`rPi> ./rPiPaperWallet.sh <enter>`

# Additional Resources:

* https://www.raspberrypi.org/downloads/raspbian/
* https://github.com/klynastor/supervanitygen
* https://github.com/brainwalletX/brainwalletX.github.io
* https://www.bitaddress.org
* https://liteaddress.org/
* 

# Future Goals

[] cURL - as this would probably be easier to deploy
[] More complex flowcontrol logic
[] Log File
