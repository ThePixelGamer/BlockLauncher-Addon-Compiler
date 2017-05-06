@echo off

::Presets
set /p tmppath=<"%~dp0path.txt"

echo Press a button to fix the Path Environment Variable or click the X button to stop the operation
TIMEOUT /T -1

setx Path "%tmppath%"

echo Press a button to clean the text files or click the X button to stop the operation

TIMEOUT /T -1

@echo 0 > bool.txt
@echo .> recdir.txt
@echo .>> recdir.txt
@echo .>> recdir.txt
@echo .> path.txt

PAUSE