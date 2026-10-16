# mac-tools

One-line Terminal fixes for Macs, written so teammates can sort out common
desktop-app chores themselves instead of following a step-by-step guide.

## Update Aircall Workspace to the latest version

Paste this into **Terminal** and press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/xChrisTan/mac-tools/main/update-aircall.sh | bash
```

What it does, in order:

1. Checks you can install apps into `/Applications` (you need to be a Mac admin;
   if you're not, it stops and tells you).
2. Downloads the latest release from Aircall's official download link, picking
   Apple Silicon or Intel automatically.
3. Quits Aircall Workspace if it's running.
4. Replaces the app in `/Applications`, relaunches it, and prints the version
   now installed.

Nothing else on your Mac is touched, and the download is cleaned up afterwards.
It's 35 lines: [read the script](update-aircall.sh) before you run it.

**Why it exists:** moving everyone to a new release used to mean downloading a
`.dmg`, quitting the app, dragging it into Applications and relaunching, on
every Mac. This turns that into one pasted line.

## License

MIT
