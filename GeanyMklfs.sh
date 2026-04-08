#!/bin/bash
# 
# Fichier; GeanyMkfs.sh
#
# Description: Permet de manipuler les options du Menu Build pour les fichiers .ino 
#              On y retrouve l'etiquette, la commande et le rep d'excution si necessaire 
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



# Batir la commande pour genere le fichier binaire du systeme de fichiers LittlFs
# Les options liees au type (FT) comme compilation d<un fichier .ino sont definies dans le fichier filetypes.Arduino.conf
# attention le fichier est ecrase lorsqu<on arrete le programme Geany 
# Donc faire les modifications lorsque Geany est absent
#  ~/.config/geany/filedefs/filetypes.Arduino.conf
#
# Les definitions actuelles sont :
#    0 Compile
#    1 Upload 
#    2 MakelittleFs Pico (se reajuste selon la version du core)
#    3 Conversion uf2
#    4 Upload Fs ttyACM0
#    5 Esp8266 Fs to .bin
#
#     Label    	    FT_03_LB=
#     Commande      FT_03_CM=
# =====================================================
#  Pour repertoire data converti en .bin
# 
#Requis: recherche de la commande (fonction de la version du core rp2040) 
COMMK=$(find ~/.arduino15/packages/rp2040 -name mklittlefs)
#echo "$COMMK"

#echo "$COMMK -c %d/data -p 256 -b 4096 -s 3145728 ~/tmp/%elittlefs.bin"

#Requis ajout des parametres pour LittleFS de 3 Mb 
COMM="$COMMK -c %d/data -p 256 -b 4096 -s 3145728 ~/tmp/%elittlefs.bin"
#echo "$COMM"

# Etiquette por option Geany  
#Note: .*permet de remplacer la ligne au complet 
LABEL="sed -i.bak 's|FT_03_LB=.*|FT_03_LB=MakeLittleFS v2 |' filetypes.Arduino.conf"
#echo "$LABEL"

# Commande pour Geany
COMMFINAL="sed -i.bak 's|FT_03_CM=.*|FT_03_CM=$COMM|' filetypes.Arduino.conf"
#echo "$COMMFINAL"

# Dans le repertoire de filetypes
cd ~/.config/geany/filedefs 

# commande combinee etiquette et commande 
COMMDOUBLE="sed -i.bak 's|FT_02_LB=.*|FT_02_LB=MakeLittleFS Pico | ; s|FT_02_CM=.*|FT_02_CM=$COMM|' filetypes.Arduino.conf"
#echo "$COMMDOUBLE"

# Envoi de la commande directement
sed -i.bak "s|FT_02_LB=.*|FT_02_LB=MakeLittleFS Pico | ; s|FT_02_CM=.*|FT_02_CM=$COMM|" filetypes.Arduino.conf

# sed donne une erreur du au fait que l'expansion ne se fait avec single quotes 
#$COMMDOUBLE
# ========================================================
# pour conversin de .bin a uf2
COMMK=$(find ~/.arduino15/packages/rp2040 -name picotool) 

COMM="$COMMK uf2 convert ~/tmp/%elittlefs.bin -t bin  ~/tmp/%elittlefs.bin.uf2 -o 0x100fe000 --family data"
sed -i.bak1 "s|FT_03_LB=.*|FT_03_LB=Conversion .bin a uf2| ; s|FT_03_CM=.*|FT_03_CM=$COMM|" filetypes.Arduino.conf

# ========================================================
# pour upload du Little FS via ttyACM0 
# a completer correctement
COMMK=$(find ~/.arduino15/packages/rp2040 -name python3)
COMMK2=$(find ~/.arduino15/packages/rp2040 -name uf2conv.py) 
COMM="$COMMK  $COMMK2 --serial ttyACM0 --family RP2040 ~/tmp/%elittlefs.bin.uf2 --deploy"
sed -i.bak2 "s|FT_04_LB=.*|FT_04_LB=Upload Pico LittleFs| ; s|FT_04_CM=.*|FT_04_CM=$COMM|" filetypes.Arduino.conf
#==============Pour ESP8266==================
# pour conversion du repertoire /data vers un fichier .bin 
echo "Pour esp8266 "
# Attention la fonction porte le meme nom qu'un repertoire modif find pour type = file 
COMMK=$(find ~/.arduino15/packages/esp8266 -name mklittlefs -type f)
#echo "Commk"
#echo "$COMMK"
COMM="$COMMK  -c %d/data -b 8192 -p 256 -s 2072576 ~/tmp/esp8266_%e.bin"
COMM2="s|FT_05_LB=.*|FT_05_LB=Esp8266 FS to .bin| ; s|FT_05_CM=.*|FT_05_CM=$COMM|"
sed -i.bak3 "s|FT_05_LB=.*|FT_05_LB=Esp8266 FS to .bin| ; s|FT_05_CM=.*|FT_05_CM=$COMM|" filetypes.Arduino.conf
#echo "comm"
#echo "$COMM"
#echo "comm2"
#echo "$COMM2"
echo "nouveau repertoire ~/tmp"
mkdir ~/tmp
