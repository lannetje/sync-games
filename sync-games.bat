@ECHO OFF

MODE 200,60

echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
echo DD                 DDDDDDDDDDDDDDDDDD                    DD
echo DD      DDDDD      DDDDDDDDDDDDDDDDDD      Nintendo      DD
echo DD      D U D      D SELECT  START  D                    DD
echo DD  DDDDD   DDDDD  DDDDDDDDDDDDDDDDDD  DDDDDDD DDDDDDD   DD
echo DD  D L   0   R D  DDDDDDDDDDDDDDDDDD  DDDDDDD DDDDDDD   DD
echo DD  DDDDD   DDDDD  D ******  ****** D  DDDDDDD DDDDDDD   DD
echo DD      D D D      DDDDDDDDDDDDDDDDDD        B       A   DD
echo DD      DDDDD      DDDDDDDDDDDDDDDDDD                    DD
echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%sync-games.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

pause