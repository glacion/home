# Nix Configuration

This repository contains the Nix-based system and home environment configurations for my machines. It utilizes **Nix Flakes**, **Home Manager**, and **nix-darwin** to manage dependencies, dotfiles, and system settings declaratively.

## Architecture

The configuration is organized into modular categories. Developer tools and languages are grouped under `module/`, and core system settings under `host/`. Flake outputs are centralized under `part/` for simpler host and home wiring.

### Structure
- **`flake.nix`**: The entry point defining inputs, outputs, and system configurations.
- **`part/hosts.nix`**: Centralized host and home configuration wiring.
- **`lib/default.nix`**: Helper constructors for NixOS, Darwin, and Home Manager.
- **`host/`**: OS-specific configurations and system settings.
- **`module/`**: Home Manager modules grouped by category.


## Hosts

| Hostname | User | System | Description |
|----------|------|--------|-------------|
| **sentinel** | `glacion` | `aarch64-darwin` | macOS environment managed via `nix-darwin` and `home-manager`. |
| **citadel** | `glacion` | `x86_64-linux` | Linux environment (WSL) managed via `home-manager`. |

## Usage

### Prerequisites
- [Nix](https://nixos.org/download.html) installed with Flakes enabled.
- [nh](https://github.com/viperML/nh) installed for nicer CLI experience.

### Applying Configuration

**For macOS (`sentinel`):**
```bash
nh darwin switch
```

**For Home Manager (`citadel` / generic):**
```bash
nh home switch
```
