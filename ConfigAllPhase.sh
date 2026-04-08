#!/bin/bash
# Fichier: ConfigAllPhase.sh
# Desc: A partir lu marquer d'etape determine la phase a executer
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

echo "Debut de la procédure ..."
if [[  -f .phase1 ]]
then
    echo "Phase 1."
    ./ConfigAllPhase1.sh
    echo "2" > .phase2

    rm .phase1
    exit
#      
fi
if [[  -f .phase2 ]]
then
    echo "Phase 2."
    ./ConfigAllPhase2.sh
    echo "3" > .phase3
    rm .phase2
    exit
#      
fi
if [[  -f .phase3 ]]
then
    echo "Phase 3."
    ./ConfigAllPhase3.sh
    echo "4" > .phase4
    rm .phase3
    exit
#      
fi
echo "Fin de la procédure ..."
