@echo off
setlocal

REM Define la ruta del escritorio
set desktop_path=%USERPROFILE%\Desktop

:menu
cls
echo ===========================
echo     Seleccione una opción:
echo ===========================
echo 1. Desactivar SMB1
echo 2. Revertir cambios (activar SMB1)
echo 3. Salir
echo ===========================
set /p choice=Ingrese su elección (1, 2, o 3): 

if "%choice%"=="1" goto desactivar_smb1
if "%choice%"=="2" goto activar_smb1
if "%choice%"=="3" goto salir

goto menu

:desactivar_smb1
echo Desactivando SMB1...
dism /online /norestart /disable-feature /featurename:SMB1Protocol >> "%desktop_path%\SMB_Log.txt"
echo SMB1 desactivado. Registro guardado en SMB_Log.txt.
pause
goto menu

:activar_smb1
echo Activando SMB1...
dism /online /norestart /enable-feature /featurename:SMB1Protocol >> "%desktop_path%\SMB2_Log.txt"
echo SMB1 activado. Registro guardado en SMB_Log.txt.
pause
goto menu

:salir
echo Saliendo del programa...
pause
endlocal
exit