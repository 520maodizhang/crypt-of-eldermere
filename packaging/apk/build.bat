@echo off
cd /d "%~dp0"
echo === Build Android APK for The Crypt of Eldermere ===

if not exist "..\..\crypt_of_eldermere.html" (
  echo ERROR: ..\..\crypt_of_eldermere.html not found.
  echo        Run this script from the original workspace.
  exit /b 1
)
if not exist www mkdir www
copy /Y "..\..\crypt_of_eldermere.html" "www\index.html" >nul

echo [1/4] installing JS deps...
call npm install
if errorlevel 1 exit /b 1

echo [2/4] adding android platform (if needed)...
if not exist android call npx cap add android

echo [3/4] syncing web assets into the native project...
call npx cap copy android
call npx cap sync android

echo [4/4] building debug APK...
cd android
call gradlew.bat assembleDebug
if errorlevel 1 (
  echo FAILED building APK.
  exit /b 1
)

echo.
echo DONE! APK at:
echo   android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 装到手机: adb install -r android\app\build\outputs\apk\debug\app-debug.apk
pause
