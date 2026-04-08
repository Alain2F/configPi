#!/bin/bash
#
# Fichier: ConfigNRGitCustom.sh
#
# Desc:  Application docker Node-red CUSTOM  
#         permet de batir une application Node-red avec la version 
#         que l'on veut dans un container Docker
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

cd ~
git clone https://github.com/node-red/node-red-docker.git
cd node-red-docker/
cd docker-custom/
cat package.json 
