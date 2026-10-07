@echo off
cd /d "%~dp0"
echo === Build Windows exe for The Crypt of Eldermere ===

REM Pull the latest game HTML from the project root
if not exist "..\..\crypt_of_eldermere.html" (
  echo ERROR: ..\..\crypt_of_eldermere.html not found.
  echo        Run this script from the original workspace, or copy the game html
  echo        next to this script as game.html.
  exit /b 1
)
copy /Y "..\..\crypt_of_eldermere.html" "game.html" >nul

echo [1/2] installing Python deps...
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo FAILED installing deps.
  exit /b 1
)

echo [2/2] bundling into a single exe (game.html packed inside)...
pyinstaller --onefile --noconfirm --name "CryptOfEldermere" --add-data "game.html;." --windowed app.py
if errorlevel 1 (
  echo FAILED building exe.
  exit /b 1
)

echo.
echo DONE. exe is at: dist\CryptOfEldermere.exe
pause
