# mac-tools

Small internal macOS helper scripts.

## Update Aircall Workspace to the latest version

Paste this into **Terminal** and hit Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/xChrisTan/mac-tools/main/update-aircall.sh | bash
```

It closes Aircall Workspace if it's open, downloads the latest release (auto-detects
Apple Silicon vs Intel), installs it, and relaunches. You must be a Mac admin.
