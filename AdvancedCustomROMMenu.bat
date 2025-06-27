@echo off
title EX-OPS Toolkit v1.0
color 0A
cls

echo.
echo --------------------------------------------------------
echo             CUSTOM ROM ADVANCED MENU V1.1
echo                     BY TheNXQIIV            
echo --------------------------------------------------------
echo.

:menu
echo [1] Modular App Debloater
echo [2] Restore Removed Apps
echo [3] Reboot Tools (Fastboot / Recovery)
echo [4] Flash Recovery or Vendor Boot
echo [5] Root Tools (Flash Magisk, SafetyNet)
echo [6] Flash ZIP via ADB Sideload
echo [7] Exit Toolkit
echo.
set /p choice=Choose an option: 

if "%choice%"=="1" goto debloat
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto reboot
if "%choice%"=="4" goto flashimg
if "%choice%"=="5" goto root
if "%choice%"=="6" goto sideload
if "%choice%"=="7" exit

:: --- Modular Debloat ---
:debloat
cls
echo.
echo === Debloat Menu ===
echo [1] Google Duo
echo [2] Google News
echo [3] YouTube Music
echo [4] Google Podcasts
echo [5] Debloat All
echo [6] Back to Main Menu
set /p debloatChoice=Choose app to remove: 

if "%debloatChoice%"=="1" adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
if "%debloatChoice%"=="2" adb shell pm uninstall -k --user 0 com.google.android.apps.magazines
if "%debloatChoice%"=="3" adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
if "%debloatChoice%"=="4" adb shell pm uninstall -k --user 0 com.google.android.apps.podcasts
if "%debloatChoice%"=="5" (
    adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
    adb shell pm uninstall -k --user 0 com.google.android.apps.magazines
    adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
    adb shell pm uninstall -k --user 0 com.google.android.apps.podcasts
)
if "%debloatChoice%"=="6" goto menu
goto debloat

:: --- App Restore ---
:restore
cls
echo.
echo === Restore Menu ===
echo [1] Google Duo
echo [2] Google News
echo [3] YouTube Music
echo [4] Google Podcasts
echo [5] Restore All
echo [6] Back to Main Menu
set /p restoreChoice=Choose app to restore: 

if "%restoreChoice%"=="1" adb shell cmd package install-existing com.google.android.apps.tachyon
if "%restoreChoice%"=="2" adb shell cmd package install-existing com.google.android.apps.magazines
if "%restoreChoice%"=="3" adb shell cmd package install-existing com.google.android.apps.youtube.music
if "%restoreChoice%"=="4" adb shell cmd package install-existing com.google.android.apps.podcasts
if "%restoreChoice%"=="5" (
    adb shell cmd package install-existing com.google.android.apps.tachyon
    adb shell cmd package install-existing com.google.android.apps.magazines
    adb shell cmd package install-existing com.google.android.apps.youtube.music
    adb shell cmd package install-existing com.google.android.apps.podcasts
)
if "%restoreChoice%"=="6" goto menu
goto restore

:: --- Reboot Tools ---
:reboot
cls
echo.
echo === Reboot Options ===
echo [1] Reboot to Fastboot
echo [2] Reboot to Recovery
echo [3] Back to Main Menu
set /p rebootChoice=Select: 
if "%rebootChoice%"=="1" adb reboot bootloader
if "%rebootChoice%"=="2" adb reboot recovery
if "%rebootChoice%"=="3" goto menu
goto reboot

:: --- Flash Recovery or Vendor Boot ---
:flashimg
cls
echo.
echo === Flash Menu ===
echo Ensure recovery.img or vendor_boot.img is in this folder.
echo [1] Flash recovery.img
echo [2] Flash vendor_boot.img
echo [3] Back to Main Menu
set /p flashChoice=Choose an option: 

if "%flashChoice%"=="1" fastboot flash recovery recovery.img
if "%flashChoice%"=="2" fastboot flash vendor_boot vendor_boot.img
if "%flashChoice%"=="3" goto menu
goto flashimg

:: --- Root Tools ---
:root
cls
echo.
echo === Root Options ===
echo [1] Flash Magisk ZIP (via sideload)
echo [2] Check root status
echo [3] Back to Main Menu
set /p rootChoice=Choose: 
if "%rootChoice%"=="1" adb sideload Magisk-v26.4.zip
if "%rootChoice%"=="2" adb shell su -v
if "%rootChoice%"=="3" goto menu
goto root

:: --- Sideload ROM or ZIP ---
:sideload
cls
echo.
echo === ZIP Flash Utility ===
echo Put your ROM or ZIP file in this folder and rename it to flashme.zip
echo Ready to sideload?
pause
adb sideload flashme.zip
goto menu
