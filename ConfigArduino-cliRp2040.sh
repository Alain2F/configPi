#!/bin/bash
# 
# Fichier; ConfigArduino-cliRp2040.sh
#
# Desc: Permet l'installation du noyeau (CORE) pour rp2040 Raspberry pi PICO  
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

# Pour le noyeau RP2040
cd ~/.arduino15
 if grep -q "rp2040" arduino-cli.yaml; then
    echo "Deja pret pour RP2040"
else
    echo "Ajout pour Rp2040"
    sed -i.bak3 '/additional_urls:/a\        - https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json' arduino-cli.yaml
    sed -i.bak3 "s|boardsmanager.additional.urls=.*|&,https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json|" preferences.txt
fi 

arduino-cli core install rp2040:rp2040 

# Pour le tool de chargement de LittleFs 
cd ~/Downloads
wget https://github.com/earlephilhower/arduino-pico-littlefs-plugin/releases/download/0.2.0/PicoLittleFS-0.2.0.zip
unzip PicoLittleFS-0.2.0.zip -d ~/Arduino/tools/
rm PicoLittleFS-0.2.0.zip
