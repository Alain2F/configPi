#!/usr/bin/env python

# par : Alain Fortier
# Date: 14 Decembre 2021
# simple program to compile and upload Arduino code using the Arduino command line
# script qui permet de produire la commande de compilation d'un programme arduino
import os
import subprocess
import sys
from datetime import datetime

# les parametres, 1=Action (Ex: compile) 2= La reference du fichier .ino
actionLine = sys.argv[1]
projectFile = sys.argv[2]

# Saisi des parametres en commentaire au debut du programme .ino (5 lignes)
codeFile = open(projectFile, 'r')
startLine = codeFile.readline()[3:].strip()
arduinoProg = codeFile.readline()[3:].strip()
boardLine = codeFile.readline()[3:].strip()
portLine = codeFile.readline()[3:].strip()
endLine = codeFile.readline()[3:].strip()
codeFile.close()

#print (projectFile)
#print (startLine)
#print (actionLine)
#print (boardLine)
#print (portLine)
#print (endLine)

# validation
#arduino-cli compile --fqbn esp8266:esp8266:d1_mini Dummy
if (startLine != "python-build-start" or endLine != "python-build-end"):
 print("\n Error in build-commands - can't process file")
 sys.exit()

#  La commande 
arduinoCommand =  arduinoProg + " " + actionLine + " --fqbn " + boardLine + " -p " + portLine + " --verbose " + projectFile
filename = x = os.path.basename(projectFile)

# dans le cas ou l<action est scompile (sauver la commande de compilation et generation d'un sommaire de compilation )
if actionLine == "scompile":
 #print ("le BoardLine:")
 #print (boardLine)
 noms = boardLine.split(":")
 #print ("le nom du microcontroleur:")
 #print (noms[2])
 #print ("le nom du répertoire:")
 fichier = projectFile.split("/",3)
 #print (fichier[3])
 #print (fichier)
 fichierBase = projectFile.split("/")
 #print ("Le fichier de base est:")
 #print (fichierBase[len(fichierBase)-1])
 repert = "~/" + fichier[3]
 print("le repertoire relatif:")
 #print (repert) 
 path1 = os.environ['HOME']
 # la commande 
 arduinoCommand =  "arduino-cli compile"  + " --fqbn " + boardLine + " -v -p " + portLine + " " + repert + " > " + '~/ArduinoCompile/' + fichierBase[len(fichierBase)-1]+"_" + noms[2] + ".txt 2>&1 ;sleep 2m"
 print (arduinoCommand)
 #print (path1)
 # sauvegarde de la commande dans un fichier
 with open(path1 +'/ArduinoCompile/Scompile2.txt', 'a') as f:
   f.write(arduinoCommand)
   f.write('\n')
 sys.exit()

# Cette section est utilisee pour la compilation et le upload 

print("\n\n -- Arduino Command --")
print(arduinoCommand)
# capture de l'jeure de debut et de fin 
print("-- Starting %s --\n" %(actionLine))

now = datetime.now().time() # time object
print("début =", now)
presult = subprocess.call(arduinoCommand, shell=True)
now = datetime.now().time() # time object
print("fin =", now)

if presult != 0:
 print("\n Failed - result code = %s --" %(presult))
else:
 print("\n-- Success --")
# if actionLine == "upload":
 # puttyCmd = "sudo putty -load \"ConsoleSudo\""
 # subprocess.call(puttyCmd, shell=True)
