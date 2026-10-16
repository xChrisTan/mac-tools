#!/bin/bash
# Update Aircall Workspace (macOS) to the latest release.
# Usage:  curl -fsSL <RAW_URL> | bash
set -euo pipefail

APP="Aircall Workspace"
case "$(uname -m)" in arm64) ARCH=arm64;; *) ARCH=x64;; esac

if [ ! -w /Applications ]; then
  echo "❌ You need to be a Mac admin to install apps into /Applications."
  echo "   Ask IT or use an admin account, then re-run this."
  exit 1
fi

DMG="$(mktemp -d)/aircall.dmg"
echo "⬇️  Downloading the latest $APP ($ARCH)…"
curl -fL "https://electron.aircall.io/download/osx?appType=aircall-workspace&arch=$ARCH" -o "$DMG"

echo "🛑 Closing $APP if it's open…"
osascript -e "quit app \"$APP\"" 2>/dev/null || true
sleep 2
pkill -f "$APP" 2>/dev/null || true
sleep 1

echo "📦 Installing…"
MNT="$(hdiutil attach "$DMG" -nobrowse -noautoopen | grep -o '/Volumes/.*' | tail -1)"
rm -rf "/Applications/$APP.app"
cp -R "$MNT/$APP.app" "/Applications/"
hdiutil detach "$MNT" -quiet
rm -rf "$(dirname "$DMG")"

VER="$(defaults read "/Applications/$APP.app/Contents/Info.plist" CFBundleShortVersionString 2>/dev/null || echo '?')"
echo "🚀 Launching…"
open "/Applications/$APP.app"
echo "✅ Done — $APP is now version $VER."
