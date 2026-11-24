# Homebrew Tap

Official Homebrew tap for native open-source apps by [Sergey V. (Blinks44)](https://github.com/Blinks44).

## Usage

```sh
brew tap blinks44/tap
```

## Available Casks

| App | Description | Install |
| --- | --- | --- |
| [**Hearth**](https://hearth.moduix.dev) | Local dev environment dashboard for runtimes, PATH, projects, Docker, Kubernetes, databases, and AI agents | `brew install --cask blinks44/tap/hearth` |
| [**Monny**](https://monny.moduix.dev) | Native macOS menu bar system monitor, battery charge limit, port finder, and AI quota tracker | `brew install --cask blinks44/tap/monny` |
| [**Rebind**](https://rebind.moduix.dev) | Native macOS input remapper for keyboards, multi-button and Logitech HID++ mice, smooth scrolling, Trackpad, and Magic Mouse | `brew install --cask blinks44/tap/rebind` |

Casks are updated automatically by each repository's release workflow with verified SHA-256 checksums.

## Upgrading

```sh
brew upgrade --cask hearth monny rebind
```
