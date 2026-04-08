#!/bin/bash
#
# Fichier; ConfigArduino-cli.sh 
#
# Dec:  Procede a l'installation de arduino-cli selon le marqueur 32 bits ou 64 bits 
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

if [[ ! -d ~/bin ]]
then
    echo "Nouveau répertoire bin ."
    mkdir ~/bin 
fi

if [ -f ./.Config64 ]
then
   echo "Arduino-cli 64 bits "
   cd ~/Downloads
   wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARM64.tar.gz
   tar -xf arduino-cli_latest_Linux_ARM64.tar.gz -C ~/bin

fi
if [ -f ./.Config32 ]
then
   echo "Arduino-cli 32 bits "
   cd ~/Downloads
   wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARMv7.tar.gz
   tar -xf arduino-cli_latest_Linux_ARMv7.tar.gz -C ~/bin
fi
if [ -f ./.Linux ]
then
	echo "ajustement du PATH"
	export PATH=~/bin:$PATH
	echo " export PATH=:$PATH" >>~/.bashrc
fi
which arduino-cli
whereis arduino-cli
arduino-cli version
echo "Faire Logout/Login pour activer la commande arduino-cli"
#arduino version
