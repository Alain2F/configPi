#!/bin/bash
# Fichier: distrib.sh
# Desc: detremine la distribution de Linux presente et genere
#        les variables op.sys et .shortCpuId
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


if [ -f /etc/system-release ]
then
Release=$(cat /etc/system-release)
y=$(echo $Release | awk '{print $1}')
echo $y
fi
if [ -f /etc/os-release ]
then 
Release=$(cat /etc/os-release)
y=$(echo $Release | awk '{print $1}')
echo $y
fi
#check Fedora
if [[ $y = *"Fedora"* ]]
then
  echo "Linux Fedora."
  echo $Release > .Fedora
 # pour le CPU 
  s=$(sudo dmidecode | grep -A2 '^System Information'|tail -n1 |awk -F: '{print$2}'|awk '{print $2$3$5}')
 # OS 
  t=$(cat /etc/system-release |awk '{print $1$3}')
echo \"$s:$t\" >.op.Sys
fi
# pour Ubuntu
if [[ $y == *"Ubuntu"* ]]; then
  echo "Ubuntu"
  echo "Ubuntu" > .Linux
  echo "Ubuntu" > .Ubuntu
# assignation de .op.Sys contenant le nom du systeme d'exploitation   
#head -n1 /etc/os-release |awk -F= '{print $2}'
 r=$(head -n1 /etc/os-release)
 v=$(echo $r | awk -F= '{print $2}')
 echo $v >.op.Sys
# Identification du CPU 
tail -n1 /proc/cpuinfo |awk -F: '{print $2}' >.cpuId
s=$(tail -n1 /proc/cpuinfo |awk -F: '{print $2}'|awk '{print $2$3$5}')
echo $s >.shortCpuId
#echo \"$s\" +  $v >.op.Sys
#Elimine les " 
t=$(echo "$v" | sed -e 's/^"//' -e 's/"$//')
echo \"$s:$t\" >.op.Sys
fi

#check Linux 
if [[ $y = *"bian"* ]]
then
  echo "Linux"
  echo "Linux" > .Linux
#cat /etc/os-release |grep CODENAME|awk -F= '{print $2}'
# version 
v=$(cat /etc/os-release |grep CODENAME|awk -F= '{print $2}')
# CPU 
s=$(tail -n1 /proc/cpuinfo |awk -F: '{print $2}'|awk '{print $2$3$5}')
echo $s >.shortCpuId
echo \"$s:$v\" >.op.Sys
fi
#check Linux 
if [[ $y = *"aspbian"* ]]
then
  echo "Linux"
  echo "Linux" > .Linux
fi
