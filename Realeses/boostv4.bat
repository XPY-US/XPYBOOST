@echo off
setlocal EnableDelayedExpansion
color 1F
title XPYBOOST v4.0 by XPY-US | Ultimate Performance Suite
mode con: cols=85 lines=52
chcp 65001 >nul 2>&1

:: ================================================================
:: AUTO-ELEVATION (RUN AS ADMIN)
:: ================================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo    [!] Requesting Administrator privileges...
    powershell start -verb runas '%0' am_admin & exit /b
)

:MAIN
cls
echo.
echo    ██╗  ██╗██████╗ ██╗   ██╗    ██████╗  ██████╗  ██████╗ ███████╗████████╗
echo    ╚██╗██╔╝██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝╚══██╔══╝
echo     ╚███╔╝ ██████╔╝ ╚████╔╝     ██████╔╝██║   ██║██║   ██║███████╗   ██║   
echo     ██╔██╗ ██╔═══╝   ╚██╔╝      ██╔══██╗██║   ██║██║   ██║╚════██║   ██║   
echo    ██╔╝ ██╗██║        ██║       ██████╔╝╚██████╔╝╚██████╔╝███████║   ██║   
echo    ╚═╝  ╚═╝╚═╝        ╚═╝       ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   
echo.
echo    ═════════════════════════════════════════════════════════════════════════════
echo       v4.0  |  Ultimate Performance Suite  |  by XPY-US  |  github.com/XPY-US
echo    ═════════════════════════════════════════════════════════════════════════════
echo.
echo       [ 1 ]   FULL AUTO BOOST         [ 6 ]   NETWORK BOOST
echo       [ 2 ]   JUNK CLEANER            [ 7 ]   GAMING MODE
echo       [ 3 ]   RAM OPTIMIZER           [ 8 ]   BATTERY SAVER
echo       [ 4 ]   SERVICE KILLER          [ 9 ]   VISUAL STRIPPER
echo       [ 5 ]   HIGH PERFORMANCE        [ D ]   RUN DEBLOATER (PS1)
echo.
echo       [ S ]   SYSTEM HEALTH SCORE     [ I ]   SYSTEM INFO     [ 0 ]   EXIT
echo.
echo    ═════════════════════════════════════════════════════════════════════════════
echo.
set /p choice="       ENTER OPTION: "

if /i "%choice%"=="1" goto FULL_BOOST
if /i "%choice%"=="2" goto JUNK_CLEAN
if /i "%choice%"=="3" goto RAM_OPT
if /i "%choice%"=="4" goto SERV_KILL
if /i "%choice%"=="5" goto HIGH_PERF
if /i "%choice%"=="6" goto NET_BOOST
if /i "%choice%"=="7" goto GAME_MODE
if /i "%choice%"=="8" goto BAT_SAVE
if /i "%choice%"=="9" goto VIS_STRIP
if /i "%choice%"=="D" goto DEBLOAT
if /i "%choice%"=="S" goto HEALTH
if /i "%choice%"=="I" goto SYS_INFO
if /i "%choice%"=="0" exit
goto MAIN

:FULL_BOOST
cls
echo    [*] Creating Restore Point...
powershell -Command "Checkpoint-Computer -Description 'XPYBOOST_v4' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
echo    [*] Cleaning Files...
call :JUNK_CLEAN_LOGIC
echo    [*] Optimizing Services...
call :SERV_KILL_LOGIC
echo    [*] Boosting Network...
call :NET_BOOST_LOGIC
echo    [*] Applying Performance Plan...
call :HIGH_PERF_LOGIC
echo    ✅ FULL BOOST COMPLETE!
pause
goto MAIN

:JUNK_CLEAN
cls
call :JUNK_CLEAN_LOGIC
pause
goto MAIN

:JUNK_CLEAN_LOGIC
echo    [+] Wiping Temp files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
echo    [+] Wiping Prefetch & Logs...
del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1
del /q /f /s "C:\Windows\Logs\*.*" >nul 2>&1
echo    [+] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
exit /b

:HIGH_PERF
cls
call :HIGH_PERF_LOGIC
pause
goto MAIN

:HIGH_PERF_LOGIC
echo    [+] Activating High Performance Mode...
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo    [+] Disabling Hibernation (Saves Space)...
powercfg -h off >nul 2>&1
exit /b

:NET_BOOST
cls
call :NET_BOOST_LOGIC
pause
goto MAIN

:NET_BOOST_LOGIC
echo    [+] Flushing DNS & Resetting Winsock...
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
exit /b

:SERV_KILL
cls
call :SERV_KILL_LOGIC
pause
goto MAIN

:SERV_KILL_LOGIC
echo    [+] Killing Telemetry & SysMain...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
exit /b

:DEBLOAT
cls
echo    [!] This will run the PowerShell Debloater...
if exist "Debloat.ps1" (
    powershell -ExecutionPolicy Bypass -File "Debloat.ps1"
) else (
    echo    [X] Debloat.ps1 not found in folder!
)
pause
goto MAIN

:HEALTH
cls
set score=100
echo    [*] Analyzing System Health...
sc query SysMain | find "RUNNING" >nul 2>&1 && set /a score-=15
sc query DiagTrack | find "RUNNING" >nul 2>&1 && set /a score-=10
if exist "C:\Windows\Temp\*" set /a score-=10
echo.
echo    ══════════════════════════════════════════════
echo       YOUR XPYBOOST SCORE: %score% / 100
echo    ══════════════════════════════════════════════
pause
goto MAIN

:: ... (Add your original SYS_INFO, RAM_OPT, and GAME_MODE logic here)
