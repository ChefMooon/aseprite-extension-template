# Aseprite Extension Template

A template project for creating Aseprite extensions with a streamlined build workflow. This template includes everything you need to get started developing custom Aseprite extensions with Lua scripts and keyboard shortcuts.

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
├── LICENSE                        # License file
└── README.md                      # This file
```

## Getting Started

### Prerequisites
- [Aseprite](https://www.aseprite.org/) installed
- Python 3.6+ (for the build script)

### Development Workflow

1. **Edit your extension files:**
   - Add Lua code to `src/init.lua` or create additional Lua files in the `src/` directory
   - Define keyboard shortcuts in `default-keys.aseprite-keys` if needed
   - Update metadata in `package.json` (name, version, description, author, etc.)

2. **Build the extension:**
   - **Using VS Code:** Run the `Build` task (Ctrl+Shift+B or from the Task menu)
   - **Using terminal:** `python build.py`
   - This creates a `.aseprite-extension` file in the `build/` directory

3. **Install in Aseprite:**
   - Open Aseprite
   - Go to **File → Scripts → Manage Extensions**
   - Click **Add Extension** and select your `.aseprite-extension` file from the `build/` directory
   - Restart Aseprite to apply changes

## Configuration

### package.json
Update the metadata in `package.json` to match your extension:
- `name`: Unique identifier for your extension
- `displayName`: Human-readable name
- `version`: Version number (follows semantic versioning)
- `description`: Brief description of what your extension does
- `author`: Your name and contact information
- `categories`: Classification (e.g., "Keys", "Scripts", "Tools")

### default-keys.aseprite-keys
Define custom keyboard shortcuts for your extension. This file uses Aseprite's key binding syntax.

## Build Process

The `build.py` script automates extension bundling with the following features:
1. Reads the extension **name** and **version** from `package.json`
2. Automatically discovers and includes all files in the `src/` directory (no manual file list needed)
3. Includes `package.json` and `default-keys.aseprite-keys`
4. Creates a `build/` directory if needed
5. Bundles everything into a `.aseprite-extension` archive (ZIP format)
6. Names the output file using metadata from `package.json`: `{name}_v{version}.aseprite-extension`

### Adding Files to Your Extension

All files in the `src/` direction will be automatically included when building.

## Useful Resources

### Official Aseprite Documentation
- [Extensions Documentation](https://aseprite.org/docs/extensions/) - How to create and distribute extensions
- [Aseprite Scripting Guide](https://aseprite.org/docs/scripting/) - Official Lua scripting documentation
- [Aseprite API Reference](https://aseprite.org/api/) - Complete API documentation for scripts
- [Extensions: Keys](https://www.aseprite.org/docs/extensions/keys) - Keyboard shortcut documentation

### Example Extensions
- [Slice Utility](https://github.com/ChefMooon/slice-utility)

## License

This template is provided under the MIT License. See the [LICENSE](LICENSE) file for details.
