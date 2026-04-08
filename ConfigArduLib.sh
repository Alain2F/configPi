#!/bin/bash
#
# Fichier; ConfigArduLib.sh
#
# Desc: Ajout des librairies pour Arduino 
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

if [[ ! -d ~/Arduino/libraries ]]
then
    echo "Nouveau répertoire libraries."
	mkdir ~/Arduino/libraries
fi
# Ajout des libraries pour Arduino 
#arduino-cli lib search "Painless Mesh"
#arduino-cli lib search "ArduinoJson"
arduino-cli lib install "ArduinoJson"
#arduino-cli lib install ArduinoJson@6.18.5
