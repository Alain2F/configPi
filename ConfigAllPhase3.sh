#!/bin/bash
#
# FIchier: ConfigAllPhase3.sh 
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

echo "Troisième phase:"
echo "11. Installation Git Node-Red custom docker"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok installation Git Node-red Custom docker"
		./ConfigNRGitCustom.sh
		;;
	"n" | "N") 
		echo "Ok Pas de Git Node-red Custom docker"
		;;
esac

echo "12. Run Mosquitto Docker"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
		echo "Ok Run Mosquitto Docker"
		./ConfigMosquitto.sh 
		;;
	"n" | "N") 
		echo "Ok Pas de  Mosquitto Docker"
		;;
esac

echo "13.   Node-Red derniere version dans un container Docker"
./ConfigNRLatest.sh

#echo "12. Run Node-red custome Docker pour ADSS"
#echo -n "o/n: ? "
#read -r rep
#case $rep in 
	#"o" | "O") 
		#echo "Ok Run Node-red custome Docker pour ADSS"
		#./ConfigNRCustomADSS.sh
		#;;
	#"n" | "N") 
		#echo "Ok Pas de custom docker ADSS"
#esac
#echo "13. Run Node-red custome Docker pour Maison"
#echo -n "o/n: ? "
#read -r rep
#case $rep in 
        #"o" | "O") 
                #echo "Ok Run Node-red custome Docker pour domotique Maison"
                #./ConfigNRCustomMaison.sh
                #;;
        #"n" | "N") 
                #echo "Ok Pas de custom docker pour domotique Maison"
#esac

