# Windows exe build — pywebview + PyInstaller

最快上手的一条路：只要装 Python，跑一个脚本就出 exe。

## 前置
- **Python 3.9+** — https://www.python.org/downloads/
  - Windows 安装时勾选 **"Add python.exe to PATH"**

## 打包
- Windows：双击 `build.bat`
- Mac / Linux：`bash build.sh`

## 产物
`dist/CryptOfEldermere.exe`（约 30–50MB，含 Python 运行时；窗口用系统自带 WebView，所以不再带浏览器内核）

## 原理
1. `app.py` 用 pywebview 开一个原生窗口加载 `game.html`
2. PyInstaller 把 Python 解释器 + `game.html` + 依赖全打进一个 exe
3. 双击 exe → 解压到临时目录 → 起窗口 → 加载游戏

## 常见问题
- **打包后双击没反应**：去掉 `--windowed` 重打一次能看到报错（命令行里跑 `dist/CryptOfEldermere.exe`）
- **首次运行慢**：`--onefile` 每次启动要解压到临时目录，属正常；想要更快可去掉 `--onefile` 改成文件夹分发
- **Mac 上 pywebview** 需系统 WebKit（自带），Linux 需装 `python3-webview` 或相关 GTK 包
