#!/bin/bash
#
# Fichier: UpdateArduino-cli.sh
#
# Desc: Permet de forcer l<installation de la derniere version arduino-cli
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

 
if [ -f ../bin/arduino-cli ]
then
   mv ../bin/arduino-cli ../bin/arduino-cli.old
fi 

if [ -f ./.Config64 ]
then
   echo "Arduino-cli 64 bits "
   cd ~/Downloads
   rm arduino-cli_latest_Linux_ARM64.tar.gz
   wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARM64.tar.gz
   tar -xf arduino-cli_latest_Linux_ARM64.tar.gz -C ~/bin

fi
if [ -f ./.Config32 ]
then
   echo "Arduino-cli 32 bits "
   cd ~/Downloads
   rm arduino-cli_latest_Linux_ARMv7.tar.gz
   wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_ARMv7.tar.gz
   tar -xf arduino-cli_latest_Linux_ARMv7.tar.gz -C ~/bin
fi

which arduino-cli
whereis arduino-cli
#arduino-cli version
