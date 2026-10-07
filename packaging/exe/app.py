"""
The Crypt of Eldermere - desktop wrapper (pywebview).

Opens a native OS window that loads game.html. Works both when run as a plain
script and when frozen into a single exe by PyInstaller (the html is unpacked
to sys._MEIPASS at runtime).
"""
import os
import sys

import webview


def resource_path(name: str) -> str:
    """Resolve a bundled resource whether running as a script or a frozen exe."""
    base = getattr(sys, "_MEIPASS", os.path.dirname(os.path.abspath(__file__)))
    return os.path.join(base, name)


def main() -> None:
    html = resource_path("game.html")
    if not os.path.exists(html):
        print("ERROR: game.html not found next to the executable.")
        input("Press Enter to exit...")
        return

    webview.create_window(
        title="The Crypt of Eldermere",
        url=html,
        width=820,
        height=720,
        resizable=True,
        text_select=True,
    )
    webview.start()


if __name__ == "__main__":
    main()
