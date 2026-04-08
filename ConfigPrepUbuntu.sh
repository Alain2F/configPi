#!/bin/bash
#
# Fichier: ConfigPrepUbuntu.sh
#
# Desc: Permet de faire les ajustement pour ubuntu 
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

echo "Preparation"
echo "Installation de curl"
echo -n "o/n: ? "
read -r rep
case $rep in 
       "o" | "O") 
        sudo apt-get install curl 
        ;; 
        "n" | "N") 
        echo "Ok Pas de curl"
        ;;
esac

echo "Installation de git"
echo -n "o/n: ? "
read -r rep
case $rep in 
       "o" | "O") 
        sudo apt-get install git 
        ;; 
        "n" | "N") 
        echo "Ok Pas de git"
        ;;
esac


echo "Eliminer les regles de braille"
echo -n "o/n: ? "
read -r rep
case $rep in 
       "o" | "O") 
        sudo apt remove brltty
        ;; 
       "n" | "N") 
       echo "Ok regles braille eliminees"
       ;;
esac

echo "Installation de Geany"
echo -n "o/n: ? "
read -r rep
case $rep in 
        "o" | "O") 
        sudo apt-get install geany
        ;; 
        "n" | "N") 
        echo "Ok Pas de Geany"
        ;;
esac

echo "Prepartion completee"
