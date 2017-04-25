# rPiPaperWallets
A setup script for a raspberry pi paper wallet machine

# Motivation

Need a standard protocol to help speedup the setup of multiple paperwallet softwares.  Hopefully this script will assist in doing just that.  This should assist in the setup of a Raspberry Pi 3 (others should also work) both regard to the OS updating/printing/usb as well numerous target cryptocurrencies.

__Operating System Modifications:__
* System Update && Upgrade
* CUPS for Printing
* FUSE for USB Connection
* Turning ON Hardware Random Number Generator
* Turning OFF WiFi

__Target Cryptocurrencies:__
* Bitcoin
* Bitcoin (Testnet)
* Litecoin
* Monero
* Lisk


# Usage

Assumes that you have a base copy of Jessie on a 8 GB (or higher) microSD card, and internet connectivity.  Still this will be turning OFF WiFi - it probably makes sense that you have your Raspberry Pi 3 (again others may work) connected via ethernet cable. The WiFi should be turned off at the very end though - just incase you cannot make a physical connection. 

Ensure that you make the script executable prior to running:

'''rPi> chmod +x rPiPaperWallet.sh <enter>'''

Then run the script:

'''rPi> ./rPiPaperWallet.sh <enter>'''

# Additional Resources

XXX
