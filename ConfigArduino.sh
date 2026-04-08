#!/bin/bash
#
# Fichier: ConfigArduino.sh
# 
# Desc: Permet de faire la mise a jour et l'installation de Arduino IDE v 1.8.19
#
#
#
# Copyright (C) 2026  Alain Fortier
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

if [ -f ./.Linux ]
then
	sudo apt-get update 
	#sudo apt-get update
	sudo apt-get -y full-upgrade
fi
# Pour compilation Arduino 
if [[ ! -d /opt/Ardu1819 ]]
then
   echo "Creation du repertoire /opt/Ardu1819 "
   sudo mkdir /opt/Ardu1819
#   cd ~/Downloads
fi

if [ -f ./.Config64 ]
then
   echo "Arduino 64 bits "
   cd ~/Downloads
#   wget https://downloads.arduino.cc/arduino-1.8.18-linuxaarch64.tar.xz
   wget https://downloads.arduino.cc/arduino-1.8.19-linuxaarch64.tar.xz
   cd ~/Downloads
   sudo tar -xf arduino-1.8.19-linuxaarch64.tar.xz -C /opt/Ardu1819
fi
if [ -f ./.Config32 ]
then
   echo "Arduino 32 bits "
   cd ~/Downloads
#   wget https://downloads.arduino.cc/arduino-1.8.18-linuxarm.tar.xz
    wget https://downloads.arduino.cc/arduino-1.8.19-linuxarm.tar.xz
   cd ~/Downloads
   sudo tar -xf arduino-1.8.19-linuxarm.tar.xz -C /opt/Ardu1819
fi

cd /opt/Ardu1819/arduino-1.8.19/
sudo ./install.sh 
#cd ~/Arduino/
sudo usermod -a -G dialout $USER
if [[ ! -d ~/Arduino ]]
then
    echo "Nouveau répertoire Arduino."
	mkdir ~/Arduino
fi

