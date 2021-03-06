:: ****** ARK SERVER SETUP CONFIG ******
:: ServerTypes:
:: - 376030 (Survival Evolved)
:: - 445400 (Survival of The Fittest)
:: *************************************
set /A serverType=376030




@echo off 
cls 
title ARK Server Setup 

echo (%time%) Starting Setup...

echo Searching for Shortcut ...
IF EXIST "%cd%\steamcmd.exe.lnk" (
    set path="%cd%\steamcmd.exe.lnk"
    GOTO Setup
)
IF EXIST "%cd%\steamcmd.exe - Shortcut.lnk" (
    set path="%cd%\steamcmd.exe - Shortcut.lnk"
    GOTO Setup
)
echo [WARNING] No Shortcut found.

echo Searching for executable ...
IF EXIST "%cd%\Steam CMD\steamcmd.exe" (
    set path="%cd%\Steam CMD\steamcmd.exe"
    GOTO Setup  
)
echo [WARNING] No executable found.

echo [ERROR] Setup failed, Steamcmd not found.
pause 
exit 0

:Setup 
    echo SteamCmd Found, starting setup (%path%)...
    if %serverType% == 376030 (
        echo ARK  Survival Evolved setup starting ...
        if not exist "%cd%\ARK (SE)" (
            echo ARK  Survival Evolved setup starting ...
            mkdir "%cd%\ARK (SE)" 
        ) else ( 
            echo Updating ARK Survival Evolved Server ... 
        )
        start "" %path% +login anonymous +force_install_dir "%cd%/ARK (SE)/" +app_update %serverType% +quit
    ) else if %serverType% == 445400 ( 
        echo ARK Survival of The Fittest setup starting ...
        if not exist "%cd%\ARK (SOTF)" (
            echo ARK Survival of The Fittest setup starting ...
            mkdir "%cd%\ARK (SOTF)" 
        ) else ( 
            echo Updating ARK Survival of The Fittest Server ... 
        )
        start "" %path% +login anonymous +force_install_dir "%cd%/ARK (SOTF)/" +app_update %serverType% +quit
    ) else ( 
	echo [ERROR] Invalid Server Type.
	pause
    )
exit 0