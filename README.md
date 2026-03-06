# Aseprite Extension Template

> A template project for creating [Aseprite](https://www.aseprite.org/) extensions with a streamlined build workflow.

## Features

- **Zero-config bundling** — all files in `src/` are included automatically
- **VS Code integration** — build with `Ctrl+Shift+B`
- **Auto-versioned output** — output file is named using your `package.json` metadata
- **Keyboard shortcut support** — optional `default-keys.aseprite-keys` file included

---

## Project Structure

```
.
├── src/                           # Source files for your extension
│   ├── init.lua                   # Main entry point (required)
│   └── [additional lua files]     # Your extension modules
├── build/                         # Build output directory (generated)
├── build.py                       # Build script to bundle the extension
├── package.json                   # Extension metadata and configuration
├── default-keys.aseprite-keys     # Keyboard shortcuts (optional)
├── LICENSE
└── README.md
```

## Getting Started

### Prerequisites

- [Aseprite v1.2-beta10+](https://www.aseprite.org/)
- [Python 3.6+](https://www.python.org/downloads/)

### Quickstart

**1. Write your extension**

Add your Lua code to `src/init.lua`. Create additional `.lua` files in `src/` as needed — they'll be picked up automatically.

**2. Update your metadata**

Edit `package.json` with your extension's details:

| Field | Description |
|---|---|
| `name` | Unique identifier (no spaces) |
| `displayName` | Human-readable name shown in Aseprite |
| `version` | Semantic version (e.g. `1.0.0`) |
| `description` | Short summary of what your extension does |
| `author` | Your name and contact info |

**3. Build the extension**

```bash
python build.py
```

Or in VS Code: `Ctrl+Shift+B` (or **Terminal → Run Build Task**)

This generates a file like `build/my-extension-v1.0.0.aseprite-extension`.

**4. Install in Aseprite**

1. Open Aseprite
2. Go to **File → Scripts → Manage Extensions**
3. Click **Add Extension** and select the `.aseprite-extension` file from `build/`
4. Click **Apply** then **Okay**

---

## How the Build Script Works

`build.py` does the following in order:

1. Reads `name` and `version` from `package.json`
2. Recursively collects all files from `src/`
3. Includes `package.json` and `default-keys.aseprite-keys` (if present)
4. Creates the `build/` directory if it doesn't exist
5. Bundles everything into a ZIP archive with the `.aseprite-extension` extension
6. Names the output: `{name}-v{version}.aseprite-extension`

> **Tip:** You never need to maintain a manual file list. Just add files to `src/` and rebuild.

---

## Keyboard Shortcuts

If your extension uses custom keybindings, define them in `default-keys.aseprite-keys` using [Aseprite's key binding syntax](https://www.aseprite.org/docs/extensions/keys).

---

## Automated Releases with GitHub Actions

This template includes a GitHub Actions workflow (`.github/build.yml`) that automatically builds and publishes releases to GitHub when you push to the main branch.

### How It Works

The workflow triggers automatically when you push a commit with `[release]` in the commit message:

```bash
git commit -m "Added new feature [release]"
git push origin main
```

When triggered, the workflow:

1. Checks out your repository
2. Sets up Python
3. Extracts your extension's `name` and `version` from `package.json`
4. Runs `python build.py` to build the extension
5. Uploads the `.aseprite-extension` file as a build artifact
6. Creates a GitHub release with the built extension attached
7. Auto-generates release notes from your commit history

### Setup

The workflow is already configured and ready to use. Just make sure:

1. Your repository is on GitHub
2. The `.github/workflows/build.yml` file is present
3. Your `package.json` has valid `name` and `version` fields

No additional configuration needed — pushing `[release]` to main will trigger the build and release automatically.

---

## Resources

### Official Aseprite Docs
- [Extension Development Guide](https://aseprite.org/docs/extensions/) — how extensions work
- [Scripting Guide](https://aseprite.org/docs/scripting/) — Lua scripting in Aseprite
- [API Reference](https://aseprite.org/api/) — full Aseprite Lua API
- [Keys Extension Docs](https://www.aseprite.org/docs/extensions/keys) — keyboard shortcut format

### Example Extensions
- [Slice Utility](https://github.com/ChefMooon/slice-utility) — a real-world example to learn from

---

## License

MIT — see [LICENSE](LICENSE) for details.