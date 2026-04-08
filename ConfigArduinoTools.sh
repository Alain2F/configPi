#!/bin/bash
# 
# Fichier; ConfigArduinoTools.sh 
#
# Desc: IPermet d'installer les plugins pour SPIFFS et littlefs pour esp8266
#                       pour SPIFFS pour ESP32 
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


cd 	/tmp
if [[ ! -d ~/Arduino/tools ]]
then
    echo "Nouveau répertoire ~/Arduino/tools/."
        mkdir ~/Arduino/tools
fi

# Littlefs pour esp8266
wget https://github.com/earlephilhower/arduino-esp8266littlefs-plugin/releases/download/2.6.0/ESP8266LittleFS-2.6.0.zip
unzip ESP8266LittleFS-2.6.0.zip -d ~/Arduino/tools/
# SPIFFS  pour esp8266
wget https://github.com/esp8266/arduino-esp8266fs-plugin/releases/download/0.5.0/ESP8266FS-0.5.0.zip
unzip ESP8266FS-0.5.0.zip -d ~/Arduino/tools/
# SPIFFS  pour esp32

if [[ ! -d ~/Arduino/tools/ESP32FS ]]
then
    echo "Nouveau répertoire ~/Arduino/tools/ESP32FS/tool/."
        mkdir ~/Arduino/tools/ESP32FS
	mkdir ~/Arduino/tools/ESP32FS/tool
fi


# Nouvelle version tool universel SPIFFS littlefs et fat

wget https://github.com/lorol/arduino-esp32fs-plugin/releases/download/2.0.7/esp32fs.zip
unzip esp32fs.zip -d ~/Arduino/tools/ESP32FS/tool
