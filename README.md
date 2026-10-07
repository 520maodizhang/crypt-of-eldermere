# 🗝️ The Crypt of Eldermere

A **1976-style text adventure** in the tradition of *Colossal Cave Adventure* and *Zork* — green-screen terminal, typewriter effect, classic two-word parser. Single self-contained HTML file.

```
  ***************************************
  *     T H E   C R Y P T   O F         *
  *         E L D E R M E R E           *
  *      a text adventure  -  (c) 1976  *
  ***************************************
```

## ▶️ Play right now
Open `crypt_of_eldermere.html` in any browser. That's it. (Type `help` in-game for commands.)

## 📦 Download the ready-made builds
Go to **[Releases](../../releases)** and grab:
- **`CryptOfEldermere.exe`** → Windows, double-click to run
- **`app-debug.apk`** → Android, transfer to phone and install

No Python, no Android Studio, no build steps — just download and run.

> Builds are produced automatically by GitHub Actions (see `.github/workflows/build-release.yml`). Every new version tag triggers a fresh build.

## 🔧 Build it yourself
See [`packaging/README.md`](packaging/README.md) for the local build scripts (pywebview+PyInstaller for exe, Capacitor for APK).

## 🗺️ The game
8 rooms, a handful of classic puzzles: dark corridors need a lantern 🔦, locked doors need a key 🗝️, an underground river needs a rope 🪢, a stone guardian needs a sword ⚔️. Find the ancient scroll and read it to lift the silence on the kingdom of Eldermere.
