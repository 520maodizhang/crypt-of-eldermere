# 打包《The Crypt of Eldermere》

源游戏：`../../crypt_of_eldermere.html`（单文件，自包含 HTML/CSS/JS，不联网）

两个脚本都会**先从源文件拷贝最新游戏 HTML**，所以你改了游戏重跑脚本即可，不用手动复制。

---

## 🪟 Windows exe（pywebview + PyInstaller）
目录：`exe/`
- 前置：Python 3.9+
- 打包：双击 `exe/build.bat`（Windows）或 `bash exe/build.sh`（Mac/Linux）
- 产物：`exe/dist/CryptOfEldermere.exe`（约 30–50MB）

## 📱 Android APK（Capacitor）
目录：`apk/`
- 前置：Node 18+ 和 Android Studio（自带 JDK + SDK）
- 打包：双击 `apk/build.bat`（Windows）或 `bash apk/build.sh`（Mac/Linux）
- 产物：`apk/android/app/build/outputs/apk/debug/app-debug.apk`

---

## 先做哪个？
- 想最快看到成果 → 先做 **exe**，5 分钟、只要 Python。
- 想装手机上玩 → 做 **APK**，配 Android Studio 那步一次配好以后都顺。

两条路互不影响，可只做其中一个。
