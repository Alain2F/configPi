#!/bin/bash
# Ficher: ConfigParam.sh
#
# Desc: Determine si 32 bit ou 64 bit et ajuste le depart a l'etape 1
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
#
#//ARCH=$(uname -m)
ARCH=$(getconf LONG_BIT)
echo "${ARCH}"
if [[ $ARCH = "32" ]]
then
  echo "Architecture 32 bits."
  echo "32" > .Config32;
fi
if [[ $ARCH = "64" ]]
then
  echo "Architecture 64 bits."
  echo "64" > .Config64;
fi
#Determine la distribution .Fedora ou .Linux
./Distrib.sh

if [ ! -f .Config32 ] && [ ! -f .Config64 ] ; 
then echo "Pas de fichiers"; 

while true; do
    read -p "Configuration Linux (1) 32 bits (2) 64 bits?" yn
    case $yn in
        [1]* ) echo "32" > .Config32; break;;
        [2]* ) echo "64" > .Config64; break;;
        * ) echo "Répondre 1 pour 32 bits ou 2 pour 64 bits";;
    esac
done 
fi


# if [ ! -f "f1" ] || [ ! -f "f2" ] ; then echo MISSING; fi 
if [ ! -f .Config32 ] && [ ! -f .Config64 ] ; then echo "Pas de fichiers"; exit ; fi 

#if [ ! \( -f "f1" -a -f "f2" \) ]

if [ -f .Config32 ]
then
   echo "Configuration 32 bits"
fi
if [ -f .Config64 ] 
then
   echo "Configuration 64 bits"
fi
if [ -f ./.Phase4 ]
then
   echo "Phase completee eliminee "
   rm ./Phase4
fi
if ls ./.Phase* 1> /dev/null 2>&1; then
    echo "La prochaine phase est definie"
else
    echo "Aucune phase. Phase 1 definie"
    echo "1" > ./.phase1 
fi
#Verifie si Downloads existe 
if [ -f ~/Downloads ]
then  
echo "Downloads existe "
else 
echo "Creation de Downloads  "
mkdir ~/Downloads
fi

while true; do
    read -p "Pret a lancer la configuration ?" yn
    case $yn in
        [oO]* ) echo "Configuration"; ./ConfigAllPhase.sh; break;;
        [nN]* ) echo "Anulation ..." ; exit;;
        * ) echo "Répondre par oO ou nN";;
    esac
done 
