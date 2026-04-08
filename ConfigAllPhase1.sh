#!/bin/bash
#
# FIchier: ConfigAllPhase1.sh 
#
# Desc: Configuration complete en séquence 
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


if [ -f ./.Fedora ]
then
	./ConfigPrepFedora.sh
fi
if [ -f ./.Ubuntu ]
then
        ./ConfigPrepUbuntu.sh
fi
echo "Installation de Geany"
sudo apt-get install geany

echo "Première phase:"
echo "1. Installation Arduino 1.8.19"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation de Arduino"
		./ConfigArduino.sh
		;;
	"n" | "N") 
		echo "Ok Pas de Arduino"
		;;
esac


echo "2. Installation Arduino-cli derniere version"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation de Arduino-cli"
		./ConfigArduino-cli.sh
		;;
	"n" | "N") 
		echo "Ok Pas de Arduino-cli"
		;;
esac
# Demarrer Geany pour creer les fichiers de configuration
geany
echo " Faire Logout/Login, fin de la premiere phase"
