#!/bin/bash
#
# Fichier: ConfigArduino-cliESP32.sh
#
# Desc: Ajout du noyeau (CORE) pour ESP32
# 
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

# Pour le noyeau ESP32
cd ~/.arduino15
 if grep -q "esp32" arduino-cli.yaml; then
    echo "Deja pret pour esp32"
else
    echo "Ajout pour esp32"
    sed -i.bak2 '/additional_urls:/a\        - https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json' arduino-cli.yaml
    sed -i.bak2 "s|boardsmanager.additional.urls=.*|&,https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json|" preferences.txt
fi 


arduino-cli core update-index
arduino-cli core install esp32:esp32

# pour esp32  sur Ubuntu
if [ -f ./.Ubuntu ]
then
	echo "Ajustement de la version python"
	sudo apt install -y python-is-python3 
	sudo apt install -y python3-serial
fi
