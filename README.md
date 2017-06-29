# rPiPaperWallets.sh
A setup script for a raspberry pi paper wallet machine, for a number of cryptocurrencies. The script will install OS utilies and tools related to the creation and security of your raspberry pi system to perform necessary functions.  The other portion is the installation of an HTML file that allows for easy access of some of the more important tools.  It should be noted that the webpage, rPi.html, was optimized for a Raspberry Pi Foundation's 7" LCD touchscreen. 

My raspberry pi unit is dedicated to this feature and thus this setup is most appropriate for me.  Please change as you see fit.  Also, I just added this second part, and so the links are probably not working.

Last UPDATE:  2017 June 24 

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

__D) Web Interface:__
* Install the landing HTML file ( rPi.html )
  * TODO: Get it to autostart - although I don't know if that would be ideal for all users
* Links for all the tools

# Usage:

Assumes that you have a base copy of Jessie on a 8 GB (or higher) microSD card, and internet connectivity ( via direct ethernet cabling .)  As this script will be turning OFF your computer's WiFi. You can start off the script the first time with WiFi, though WiFi will be turned off at the  end though - just incase you cannot make a physical connection. 

Ensure that you make the script executable prior to running:

`rPi> chmod +x rPiPaperWallet.sh <enter>`

Then run the script:

`rPi> ./rPiPaperWallet.sh <enter>`

To perform an update in the future.  First change directory to the script, then remove 'x' and finally perform a pull request:

`rPi> chmod -x rPiPaperWallet.sh <enter>`
`rPi> git pull <enter>`

Then run the script as before.

# Additional Resources:

* https://www.raspberrypi.org/downloads/raspbian/
* https://github.com/klynastor/supervanitygen
* https://github.com/brainwalletX/brainwalletX.github.io
* https://veracrypt.codeplex.com/wikipage?title=Contributed%20Resources
* https://www.bitaddress.org
* https://liteaddress.org/
* 

# Future Goals

- [ ] cURL - as this would probably be easier to deploy
- [ ] More complex flowcontrol logic
- [ ] Log File
