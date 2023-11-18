# JavaFX on RaspberryPi Embedded
Bare bones demo of JavaFX on an embedded 64-bit RaspberryPi Zero 2 W with attached HDMI screen.  Hopefully this framework will get you started on making cool appliance-like things with JavaFX on Raspberry Pi.

When designing an embedded kiosk-style system on RaspBerry Pi that uses JavaFX for it's main app, this code base will quickly get you to a starting point for your own system.

I intend to publish more elaborate versions of this concept, but for this project, lets focus on starting with a new Raspberry Pi and prove that we can run JavaFX as the primary graphics application.

This example uses a Raspberry Pi 2W but should work for any 64-bit Raspberry Pi board.  Remote terminal tasks were performed on a Mac, so your Windows terminal experience might differ.

## Prepare the Raspberry Pi
Using **Raspberry Pi Imager**, create a 64-bit version of the OS (without desktop) onto the SD card. Configure the card for SSH, password and your WiFi settings so that you can log into it after first boot.  The latest *Raspberry Pi Imager* has a feature to help pre-configure this.

## Boot the Raspberry Pi
Boot your Pi and log in using a terminal on your workstation.

```
ssh pi@raspberrypi.local
```

## Update the Pi
```
sudo apt update
sudo apt upgrade
```

## Add these packages:
```
sudo apt install openjdk-17-jdk -y
sudo apt install git
sudo apt install maven
sudo apt install tree
sudo apt install libgdm-dev
sudo apt install libegl-dev
sudo apt install libgles2-mesa-dev
```
## Other Considerations for Pi Zero 2W
Even though the Pi Zero2W is 64-bit, it has limited memory compared to the Pi3 and Pi4. Also, as we are using the Pi like an appliance, it will not usually get safe shutdown treatment.  Here is a link to a great article about using 64-bit on RaspberryPi 2W.  See the part about changing the swap strategy:

https://qengineering.eu/install-64-os-on-raspberry-pi-zero-2.html

## Install JavaFX
Unless you posses a commercial license, you will always need to use early access (EA) releases of *JavaFX*.  The Direct Rendering features used for kiosk mode applications are licensed by *Gluon* but are available for developers.
Browse your download options here: https://gluonhq.com/products/javafx/

You should be choosing an **Early Access, Linux, aarch64, Monocle SDK** download.

As of 2022 September, I used *version 20 EA + 2* (example):
```
wget https://download2.gluonhq.com/openjfx/20/openjfx-20-ea+2_monocle-linux-aarch64_bin-sdk.zip
```
To get the download link, right-click the 'Download' button and copy the link. It should point to a zip file.

If you have issues attempting to use 'wget' for downloading, use the web page on your workstation to download the ZIP file and then use 'scp' to place it onto your Pi.

## Unpack the JavaFX zip file (from your Pi SSH session)
```
unzip openjfx-20-ea+2_monocle-linux-aarch64_bin-sdk.zip
sudo mv javafx-sdk-20 /opt/
```
## Clone this repository onto the Pi
```
git clone https://github.com/maehem/JavaFX-on-RaspberryPi-embedded
cd JavaFX-on-RaspberryPi-embedded
```
## Adjust path to JavaFX
Edit the pom.xml file for the script to properly point to the version of JavaFX that you installed.  Look for 'javafx.version' definition.

## Adjust library path in execution script
Edit the 'run-kiosk.sh' file under the 'assets' folder to point to your JavaFX installation path in /opt (the variable JAVAFX_VER).  You might also have to edit the GLUON_VER in the same file ( 1.1.7 as of 2022-September). If you look in /opt/javafx-sdk-**/lib, you'll see the 'lib-gluon-1.1.?.so' file. Use that number.

## Compile the Example
```
mvn package
```
## Run the Example
If you use an input device for any interaction, you will need to 'sudo' execution.  However, there are things you can do to allow 'pi' user input device access. Use the Googles to find out more.
```
cd target/distribution
sudo ./run-kiosk.sh
```
