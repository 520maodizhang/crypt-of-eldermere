# Android APK build — Capacitor

把 web 游戏装进一个原生 Android WebView 壳，Gradle 编译出 APK。

## 前置（一次性配置）
1. **Node.js 18+** — https://nodejs.org（装 LTS 版）
2. **Android Studio** — https://developer.android.com/studio
   - 安装后首次打开，让它把 **Android SDK** + **JDK 17** 装好（点几下下一步即可）
   - 在 SDK Manager 里确认装了 **SDK Platform 34** 和 **Android SDK Build-Tools**
3. 环境变量（一般 Android Studio 会自动配，没有的话手动加）：
   - `ANDROID_HOME` = SDK 路径（如 `C:\Users\你\AppData\Local\Android\Sdk`）

## 打包
- Windows：双击 `build.bat`
- Mac / Linux：`bash build.sh`

脚本会自动：拷游戏 HTML → `npm install` → 加 Android 平台 → 同步 → `gradlew assembleDebug`

## 产物
`android/app/build/outputs/apk/debug/app-debug.apk`
- 这是 **debug 签名**包，可直接装机测试
- 装机：`adb install -r app-debug.apk`（手机开 USB 调试）
- 或直接把 apk 文件传到手机点开安装

## 想要正式签名 / 上架 Google Play
1. `npx cap open android` 用 Android Studio 打开工程
2. 菜单 **Build → Generate Signed Bundle / APK**
3. 第一次创建一个 keystore（记好密码），之后就能出 release 包
4. 上架还需在 Play Console 注册应用、填资料

## 常见问题
- **`gradlew` 报 JDK 找不到**：确认 Android Studio 自带 JDK 已装，或设 `JAVA_HOME` 指向它
- **`cap add android` 报 SDK 路径错**：检查 `ANDROID_HOME` 环境变量
- **首次构建很慢**：Gradle 在下依赖，耐心等几分钟，之后就快了
- **改了游戏后重打包**：直接重跑 `build.bat`/`build.sh`，会自动重新拷 HTML + sync
