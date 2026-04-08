#!/bin/bash
#
# Fichier: ConfigDocker.sh
#
# Desc: permet de faire l'installation de Docker pour le developpement 
#        sur Node-Red
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


cd ~
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh ./get-docker.sh
sudo systemctl start docker
sudo groupadd docker
#ajout du user dans le groupe docker
sudo usermod -aG docker $USER
#docker run hello-world
docker version
echo "faire logout/login pour activer le nouveau groupe"
