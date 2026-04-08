#!/bin/bash
# sourceTag.sh
# Permet d'ajouter l'information du systeme d'exploitation hote dans le source du programme C
#    le script est stocke dans le repertoire GeanyOpts 

OP=$(cat ~/GeanyOpts/.op.Sys)
#sed -i "/String opSystem/c\String opSystem = ${OP} ;" /tmp/PicoAdss2.ino
sed -i "/String opSystem/c\String opSystem = ${OP} ;" $1
