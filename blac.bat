@echo off

setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /f "tokens=*" %%A in (recdir.txt) do (
    set /A vidx=!vidx! + 1
    set dir!vidx!=%%A
)

::List recently used directories
if %dir1%==. (
	goto nocontent
) else (
	if %dir2%==. (
		goto dir1content
	) else (
		if %dir3%==. (
			goto dir2content
		) else (
			goto dir3content
		)
	)
)

:nocontent
echo No recent directories
goto next

:dir1content
echo (1) %dir1%
goto next

:dir2content
echo (1) %dir1%
echo (2) %dir2%
goto next

:dir3content
echo (1) %dir1%
echo (2) %dir2%
echo (3) %dir3%
goto next

:next
::Ask what directory is the mod located
set /p dir="Location of mod: "

if "%dir%"=="1" (
	goto direqual1
) else (
	if "%dir%"=="2" (
		goto direqual2
	) else (
		if "%dir%"=="3" (
			goto direqual3
		) else (
			goto nextagain
		)
	)
)

:direqual1
set dir=%dir1%
@echo %dir1%> recdir.txt
@echo %dir2%>> recdir.txt
@echo %dir3%>> recdir.txt
goto end

:direqual2
set dir=%dir2%
@echo %dir1%> recdir.txt
@echo %dir2%>> recdir.txt
@echo %dir3%>> recdir.txt
goto end

:direqual3
set dir=%dir3%
echo %dir1%> recdir.txt
echo %dir2%>> recdir.txt
echo %dir3%>> recdir.txt
goto end

:nextagain

if %dir1%==. (
	@echo %dir%> recdir.txt
	@echo .>> recdir.txt
	@echo .>> recdir.txt
) else (
	if %dir2%==. (
		@echo %dir1%> recdir.txt
		@echo %dir%>> recdir.txt
		@echo .>> recdir.txt
	) else (
		if %dir3%==. (
			@echo %dir1%> recdir.txt
			@echo %dir2%>> recdir.txt
			@echo %dir%>> recdir.txt
		) else (
			@echo %dir2%> recdir.txt
			@echo %dir3%>> recdir.txt
			@echo %dir%>> recdir.txt
		)
	)
)

:end

::Build .so and .apk
echo Building the apk
START cmd.exe /k "cd %dir% & ndk-build & ant debug & exit"

echo Press a button to get the apk
TIMEOUT /T -1

echo Apk is located in the root of the mod's directory
xcopy /s /i "%dir%\bin\*debug.apk" "%dir%\apk"

PAUSE