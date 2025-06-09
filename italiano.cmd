@echo off
echo Installazione del Language Pack Italiano tramite CMD...

powershell -Command Install-Language it-IT -CopyToSettings -Features Handwriting, OCR, Speech
dism /online /add-capability /capabilityname:Language.Handwriting~~~it-IT~0.0.1.0
dism /online /add-capability /capabilityname:Language.OCR~~~it-IT~0.0.1.0
dism /online /add-capability /capabilityname:Language.Speech~~~it-IT~0.0.1.0

:: Imposta la lingua di sistema
dism /online /set-lang:it-IT
powershell -Command Set-WinUserLanguageList it-IT -Force
:: Modifica le chiavi di registro per forzare il cambio lingua
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage /t REG_SZ /d 0410 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language" /v Default /t REG_SZ /d 0410 /f

:: Imposta la lingua di visualizzazione
powershell -Command "Set-WinUILanguageOverride -Language it-IT"

:: Riavvia per applicare le modifiche
echo Riavvio necessario per applicare le modifiche,è possibile procedere con installare windows lenna lingua selezionata...
pause
shutdown /r /t 0
