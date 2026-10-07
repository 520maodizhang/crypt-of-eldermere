#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
echo "=== Build desktop app for The Crypt of Eldermere ==="

if [ ! -f ../../crypt_of_eldermere.html ]; then
  echo "ERROR: ../../crypt_of_eldermere.html not found."
  echo "       Run this script from the original workspace, or copy the game html"
  echo "       next to this script as game.html."
  exit 1
fi
cp ../../crypt_of_eldermere.html game.html

echo "[1/2] installing Python deps..."
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

echo "[2/2] bundling into a single executable (game.html packed inside)..."
pyinstaller --onefile --noconfirm --name "CryptOfEldermere" \
  --add-data "game.html:." \
  --windowed \
  app.py

echo ""
echo "DONE. executable at: dist/CryptOfEldermere"
