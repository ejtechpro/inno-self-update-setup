@echo off
echo ========================
echo Building Hello...
echo ========================

REM Clean previous build
rmdir /s /q build
rmdir /s /q dist
del /q innoselfupdate.spec

REM Run PyInstaller
pyinstaller main_v1.0.0.py ^
    --name innoselfupdate ^
    --noconfirm ^
    --windowed ^
    --clean ^
    --onedir ^
    --icon=assets\icon.ico ^
    --add-data "assets;assets" ^
    

echo ========================
echo Build Complete!
echo ========================
pause
