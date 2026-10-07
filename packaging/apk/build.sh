#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
echo "=== Build Android APK for The Crypt of Eldermere ==="

if [ ! -f ../../crypt_of_eldermere.html ]; then
  echo "ERROR: ../../crypt_of_eldermere.html not found."
  echo "       Run this script from the original workspace."
  exit 1
fi
mkdir -p www
cp ../../crypt_of_eldermere.html www/index.html

echo "[1/4] installing JS deps..."
npm install

echo "[2/4] adding android platform (if needed)..."
[ -d android ] || npx cap add android

echo "[3/4] syncing web assets into the native project..."
npx cap copy android
npx cap sync android

echo "[4/4] building debug APK..."
cd android
./gradlew assembleDebug

echo ""
echo "DONE! APK at:"
echo "  android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "装到手机: adb install -r android/app/build/outputs/apk/debug/app-debug.apk"
