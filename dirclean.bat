@echo off

::Ask what directory is the mod located
set /p dir="Location of mod to be cleaned: "

START cmd.exe /k "rmdir /s %dir%\apk & rmdir /s %dir%\bin & rmdir /s %dir%\libs & rmdir /s %dir%\obj & exit"

echo Directories cleaned

PAUSE