#!/bin/bash
# 
# Fichier; ConfigArduino-cliESP8266.sh
#
# Desc: ajoute le noyeau (CORE) de developpement pour ESP8266 
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

arduino-cli config init
sleep 2s 
cd ~/configPi
cd KitPi/Arduino
cp arduino-cli_vide.yaml ~/.arduino15/arduino-cli.yaml

# Copier le preferences 
cd ~/configPi
cp ./KitPi/Arduino/preferences-esp32-dev.txt ~/.arduino15/preferences.txt

# Pour le noyeau ESP8266 
cd ~/.arduino15
 if grep -q "esp8266" arduino-cli.yaml; then
    echo "Deja pret pour esp8266"
else
    echo "Ajout pour esp8266"
    sed -i.bak '/additional_urls:/a\        - http://arduino.esp8266.com/stable/package_esp8266com_index.json' arduino-cli.yaml
    sed -i.bak  "s|boardsmanager.additional.urls=.*|boardsmanager.additional.urls=http://arduino.esp8266.com/stable/package_esp8266com_index.json|" preferences.txt
fi 
arduino-cli core update-index
arduino-cli core install esp8266:esp8266

# pour esp8266  sur Ubuntu
cd ~/configPi
if [ -f ./.Ubuntu ]
then
	echo "Ajustement de la version python"
	sudo apt install -y python-is-python3 
	sudo apt install -y python3-serial
fi
