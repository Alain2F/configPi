# configPi
### Scripts pour la configuration d'un Environnement de Dev Geany pour Arduino

Pour obtenir les scripts il faut faire un clone du projet:
git clone https://github.com/Alain2F/configPi.git

- **note1:**  Le répertoire configPi doit être placé dans le ~ de l'utilisateur  
	Ex: pour l'usager Jean  on utilisera   **/home/jean/configPi** 

- **note2:**  Ce programme prévoit l'utilisation du répertoire **Downloads** et non téléchargements,
		dans ce cas les scripts vont créer le répertoire **~/Downloads**
		
	

### Description: 

- Le but des scripts Bash est de faire la configuration d'un environnement de développement 
Arduino et Arduino-cli. Une fois la Phase 1 et 2 complétées, il sera possible d'utiliser 
Arduino IDE 1.8.19  ou encore démarrer Geany pour développer des programmes d'application 
Arduino .ino.

- Lorsqu'un fichier .ino est ouvert à l'aide de Geany le menu **Build** offre les options de 
compilation, de chargement et de terminal pour les messages de mise au point. 

- L'intégration des fonctions Arduino dépend des 5 premières lignes de commentaires 
du programme. Des exemples de ces 5 lignes sont disponibles dans le fichier 
**OptionsCompilation.txt**

- Description sommaire des 5 lignes:  
    -Ligne 1 = marqueur de début  
	-Ligne 2 = la localisation du programme de compilation Ex: arduino-cli  
	-Ligne 3 = le nom du micro contrôleur et les options de compilation  
	-Ligne 4 = le nom du canal de communication pour le micro contrôleur  
	-Linge 5 = marqueur de fin  



### Utilisation: 

- Pour démarrer les scripts de configuration, avec un terminal aller dans le répertoire 
~/configPi utiliser le script ./ConfigParams.sh pour faire les choix de bases 32 ou 64 bits et 
accepter le lancement de la configuration.

- On peut, par la suite, continuer la configuration en utilisant la commande:
./ConfigAllPhase.sh 

- La configuration se fait en 3 étapes.
Après les phase 1 et 2, on doit faire un Logout/Login.
La phase 3 concerne le développement d'applications Node-Red. 

- Pour les phases 2 et 3 après les login, aller dans le répertoire ~/configPi
./ConfigAllPhase.sh lancera la prochaine étape. 

 - **Étape 1:**  
  .1 ConfigArduino IDE  
  .2 Arduino-cli  

- **Étape 2:**  
.3 Arduino librairies  
.4 Arduino librairies via zip  
.5 Noyau pour ESP8266  
.6 Noyau pour ESP32  
.7 Noyau pour Rp2040/Rp2350  
.8 Arduino utilitaires pour FS  
.9 Options pour Geany  
.10 Docker (pas requis pour le dev Arduino)  

- **Étape 3: (pas requis pour le dev Arduino)**  
.11 Node-Red Git Custom Docker  
.12 Docker run mosquitto  
.13 Node-red dernière version dans un container Docker  

- Certains scripts sont indépendants du menu :  
	. UpdateArduino-cli.sh : installe une nouvelle version de arduino-cli  
	. uninstallDockerFedora.sh : Sous Fedora élimine le programme Docker  
	. ConfigUninstallDocker.sh : Sous Debian (Pi OS) élimine le programme Docker  

**Note:** Le répertoire KitPi contient différents fichiers de configuration, programmes Python, 
préférences,librairies, etc.

### Compatibilité

- Pour SBC Pi3, Pi4 et Pi5

- Système d'exploitation: Buster, BookWorm, Trixie, Ubuntu 22 + (Pi4), Fedora 42 + (Pi4)

- Configuration: 32 bits ou 64 bits 

