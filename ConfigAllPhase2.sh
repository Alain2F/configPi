#!/bin/bash
# Fichier:  ConfigAllPhase2.sh 
# 
# Desc: Permet de lancer la phase selon le marqueur d'etape
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

echo "Ajustement du delai arduino-cli:"
arduino-cli config set network.connection_timeout 180s
echo "Deuxième phase:"
sleep 2
echo "3. Installer Arduino librairies"
#sleep 2 
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation des libraries"
		./ConfigArduLib.sh
		;;
	"n" | "N") 
		echo "Ok Pas de libraries Arduino"
		;;
esac

echo "4. Installation Arduino lib via Zip"
#sleep 2
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation des libraries via Zip"
		./ArduinoLibViaZip.sh
		;;
	"n" | "N") 
		echo "Ok Pas de Libraries via Zip"
		;;
esac

echo "5. Installation Arduino extension ESP8266"
#sleep 2 
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation support ESP8266"
		./ConfigArduino-cliEsp8266.sh
		;;
	"n" | "N") 
		echo "Ok Pas de support ESP8266"
		;;
esac

echo "6. Installation Arduino extension ESP32"
#sleep 2 
echo -n "o/n: ? "
read -r rep
case $rep in 
        "o" | "O") 
                echo "Ok installation support ESP32"
                ./ConfigArduino-cliEsp32.sh 
                ;;
        "n" | "N") 
                echo "Ok Pas de support ESP32"
                ;;
esac

echo "7. Installation pour Raspberry Pi PICO"
#sleep 2 
echo -n "o/n: ? "
read -r rep
case $rep in 
        "o" | "O") 
                echo "Ok installation support PICO rp2040"
                ./ConfigArduino-cliRp2040.sh
                ;;
        "n" | "N") 
                echo "Ok Pas de support PICO rp2040"
                ;;
esac

echo "8. Installation Arduino modules pour Systèmes de fichiers"
#sleep 2
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation des modules pour Systemes de fichiers"
		./ConfigArduinoTools.sh
		;;
	"n" | "N") 
		echo "Ok Pas de modules pour systeme de fichiers"
		;;
esac

echo "9. Installation Commandes pour Geany"
#sleep 2 
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation des commandes Geany"
		./ConfigGeany.sh
		;;
	"n" | "N") 
		echo "Ok Pas de commandes Geany "
		;;
esac


echo "10. Installation Docker"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation Docker"
		./ConfigDocker.sh
		;;
	"n" | "N") 
		echo "Ok Pas de Docker"
		;;
esac

echo " Faire Logout/Login, fin de la deuxième phase"
