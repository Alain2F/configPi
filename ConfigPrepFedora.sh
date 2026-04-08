#!/bin/bash
#
# Fichier: ConfigPrepFedora.sh 
#
# Desc: Permet de faire les ajustements pour le cas de Fedora
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

echo "Installation de Gparted"
echo -n "o/n: ? "
read -r rep
case $rep in 
       "o" | "O") 
        sudo dnf install gparted
        ;; 
       "n" | "N") 
       echo "Ok Pas de Gparted"
       ;;
esac

echo "Installation de Geany"
echo -n "o/n: ? "
read -r rep
case $rep in 
        "o" | "O") 
        sudo dnf install geany
        ;; 
        "n" | "N") 
        echo "Ok Pas de Geany"
        ;;
esac

echo "Installation de ed"
echo -n "o/n: ? "
read -r rep
case $rep in 
	"o" | "O") 
        sudo dnf install ed
        ;; 
	"n" | "N") 
        echo "Ok Pas de ed"
        ;;
esac
echo "Prepartion completee"
