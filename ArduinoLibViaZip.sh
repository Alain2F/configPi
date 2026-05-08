#!/bin/bash
#
# Ficher:  ArduinoLibViaZip.sh
#
# Desc: Procede a l'installation de libraries via leur fichier zip
#         et quelques anciennes librairies via le repertoire KitPi
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


# ajouter MyHeaders 
  echo "Création du répertoire MyHeaders"
cd ~/configPi/
cp -r ./KitPi/MyHeaders/ ~/Arduino/libraries/
# Ajouter les anciennes librairies 
cp -r ./KitPi/Adafruit_GFX_Library/ ~/Arduino/libraries/
cp -r ./KitPi/Adafruit_SSD1306 ~/Arduino/libraries/
cp -r ./KitPi/EmonLib ~/Arduino/libraries/
# lib WiFiManager via zip 
cd ~/Downloads
wget https://github.com/tzapu/WiFiManager/archive/refs/heads/master.zip
unzip master.zip -d ~/Arduino/libraries
mv ~/Arduino/libraries/WiFiManager-master ~/Arduino/libraries/WiFiManager
rm master.zip

# Avec Arduino WebSocket
cd ~/Downloads
wget https://github.com/Links2004/arduinoWebSockets/archive/refs/heads/master.zip
unzip master.zip -d ~/Arduino/libraries
mv ~/Arduino/libraries/arduinoWebSockets-master ~/Arduino/libraries/arduinoWebSockets
rm master.zip

# Pour SHT30 sur Wemos
cd ~/Downloads
wget https://github.com/wemos/WEMOS_SHT3x_Arduino_Library/archive/master.zip
unzip master.zip -d ~/Arduino/libraries
mv ~/Arduino/libraries/WEMOS_SHT3x_Arduino_Library-master ~/Arduino/libraries/WEMOS_SHT3x_Arduino_Library
rm master.zip
