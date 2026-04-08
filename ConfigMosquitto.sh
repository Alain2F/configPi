#!/bin/bash
#
# Fichier: ConfigMosquitto.sh
#
# Desc: Permet de batir et d<executer un docker container avec Mosquitto
#       Rend Docker actif apres un reboot (enable du service)
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

docker network create iot
docker run -itd --network iot -p 1883:1883 --name mybroker eclipse-mosquitto mosquitto -c /mosquitto-no-auth.conf
#docker ps 
docker update --restart unless-stopped mybroker
sudo systemctl enable docker.service
