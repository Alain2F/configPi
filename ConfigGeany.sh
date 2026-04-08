#!/bin/bash
# 
# Fichier: ConfigGeany.sh
#
# Desc: Permet de configurer Geany pour reconnaitre les fichier .ino et 
#         ajouter les options au menu BUILD; compilation, uoload, ...
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


if [[ ! -d ~/GeanyOpts ]]
then
    echo "Nouveau répertoire GeanyOpts."
	mkdir ~/GeanyOpts
fi
if [[ ! -d ~/ArduinoCompile ]]
then
    echo "Nouveau répertoire ArduinoCompile."
        mkdir ~/ArduinoCompile
fi
cp ./KitPi/scripts/CompileTout.sh ~/ArduinoCompile/
# copier les fichiers de commandes Geany  
cp ./KitPi/GeanyOpts/*.py ~/GeanyOpts
# et les scripts (Ex: sourceTag.sh)
cp ./KitPi/GeanyOpts/*.sh ~/GeanyOpts
# Charge les définitions des types de fichier .ino   

if [[ ! -d ~/.config/geany ]]
then
    echo "Nouveau répertoire .config/geany."
        mkdir ~/.config/geany
fi
if [[ ! -d ~/.config/geany/filedefs ]]
then
    echo "Nouveau répertoire .config/geany/filedefs."
        mkdir ~/.config/geany/filedefs
fi
# copier les config des menus pour les fichiers arduino .ino
cp ./KitPi/GeanyOpts/filetypes.Arduino.conf ~/.config/geany/filedefs/
# ajuster le Working Directory en fonction de $USER
sed -i "s|/home/pi|/home/${USER}|g;" ~/.config/geany/filedefs/filetypes.Arduino.conf 
# modifier la config de Geaany pour obtenir 5 options au menu Build, section EXEC
#sed '/number_exec_menu_items=0/ {s/=0/=5/}' ~/.config/geany/geany.conf > ~/.config/geany/geany.conf.tmp ; mv ~/.config/geany/geany.conf.tmp ~/.config/geany/geany.conf
sed -i.bak 's/number_exec_menu_items=.*/number_exec_menu_items=5/; s/number_ft_menu_items=.*/number_ft_menu_items=6/' ~/.config/geany/geany.conf
# Copier l'information CPU:SystemOp
cp ~/configPi/.op.Sys ~/GeanyOpts/
# Ajouter les options Little Fs pour Pico et esp8266
./GeanyMklfs.sh
