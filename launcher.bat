@echo off
color 0a
title SprookTool
set /p username=Entrez votre nom d'utilisateur : 
set /p password=Entrez votre mot de passe : 

:: Vérification du login
if "%username%"=="Utilisateur" (
  if "%password%"=="SprookTool" (
    echo Bienvenue, %username% !
    goto menu
  ) else (
    echo Mot de passe incorrect !
    pause
    exit
  )
) else (
  echo Nom d'utilisateur incorrect !
  pause
  exit
)

:menu
cls
echo Que voulez-vous faire ?
echo 1. Eteindre l'ordinateur
echo 2. Ouvrir un programme
echo 3. Fermer un programme
echo 4. Créer un raccourci vers un site web
echo 5. Installer une application à partir d'une URL
echo 6. Quitter

set /p choix=Choix : 

if "%choix%"=="1" (
  echo Eteindre l'ordinateur en cours...
  shutdown /s /t 0
) else if "%choix%"=="2" (
  set /p prog=Entrez le nom du programme à ouvrir : 
  start "" "%prog%"
) else if "%choix%"=="3" (
  set /p prog=Entrez le nom du programme à fermer : 
  taskkill /im "%prog%" /f
) else if "%choix%"=="4" (
  set /p url=Entrez l'URL du site web : 
  set /p name=Entrez le nom du raccourci : 
  echo [InternetShortcut] > "%name%.url"
  echo URL=%url% >> "%name%.url"
) else if "%choix%"=="5" (
  set /p appurl=Entrez l'URL de l'application : 
  start /wait "" "%appurl%"
) else if "%choix%"=="6" (
  exit
) else (
  echo Choix invalide !
  pause
)

goto menu
