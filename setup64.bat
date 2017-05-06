@echo off

::Presets
for /f "usebackq tokens=3,*" %%F in (`reg query HKCU\Environment /v PATH`) do ( 
set fakepath=%%F
)

set /p boolpath=<"%~dp0bool.txt"

if %boolpath% EQU 0 goto option1
if %boolpath% EQU 1 goto option2

:option1
@echo %fakepath%> "%~dp0path.txt"
(@echo 1)> "%~dp0bool.txt"
goto option2

:option2
::Ask where they put the Android NDK
set /p NDK="Location of Android NDK: "

::Ask where they put the Android SDK
set /p SDK="Location of Android SDK: "

::Ask where they put the Apache Ant folder
set /p ANT="Location of Apache Ant: "

::Ask where did they install Java
set /p JAVA="Location of JavaDK: "

echo Setting up the necessary Windows Environment Variable
setx ANDROID_NDK "%NDK%"
setx ANDROID_SDK "%SDK%"
setx ANDROID_HOME "%SDK%"
setx ANDROID_SWT "%SDK%\tools\lib\x86_64"
setx ANT_HOME "%ANT%"
setx JAVA_HOME "%JAVA%"

setx Path "%fakepath%;%ANT%\bin;%SDK%\tools;%NDK%"

echo Install finished, run blac.bat to start compiling

PAUSE