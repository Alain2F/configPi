#Script pour la compilation de tous les programmes Arduino
#   la liste de sprogramme est cree par la fonction F5 Sauve compile dans Geany
#
# Choix de refaire la liste complete des programme tri unique
while true; do
    read -p "Regenere la liste des programme (tri unique) ?" yn
    case $yn in
        [oO]* ) echo "Tri unique ..."; sort -u Scompile.txt > List_Prog.txt; break;;
        [nN]* ) echo "La liste existante sera utilisee ..." ; break;;
        * ) echo "Répondre par oO ou nN";;
    esac
done 
#sort -u Scompile.txt > List_Prog.txt
# commande de compilation de l'ensemble le temps total sera affiche
time sh < List_Prog.txt 
