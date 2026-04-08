#!/bin/bash
#
# Fichier: ConfirNRLatest.sh
#
# Desc: Application docker node-red  latest en parallele sur port 1881 au lieu de 1880
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

if [[ ! -d ~/NRlatest ]]
then
    echo "Création du répertoire!"
    mkdir ~/NRlatest
fi
#latest
docker run -it -p 1881:1880 --network iot -v ~/NRlatest:/data --restart unless-stopped --name mynoderedL -e TZ=America/Montreal nodered/node-red:latest
docker ps
