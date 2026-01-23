# Nix Configuration

This repository contains the Nix-based system and home environment configurations for my machines. It utilizes **Nix Flakes**, **Home Manager**, and **nix-darwin** to manage dependencies, dotfiles, and system settings declaratively.

## Architecture

The configuration is highly modular. Each top-level directory (e.g., `rust`, `go`, `nvim`, `zsh`) is treated as a component that provides specific packages or configurations. These are aggregated in the root `flake.nix`.

### Structure
- **`flake.nix`**: The entry point defining inputs, outputs, and system configurations.
- **`hosts/`**: Host-specific configurations (e.g., `sentinel` for macOS).
- **Modules**:
    - **Languages**: `bun`, `go`, `nodejs`, `python`, `rust`
    - **Tools**: `cloud`, `container`, `kubernetes`, `nvim`, `utility`
    - **System**: `core`, `darwin`, `wsl`, `zsh`

## Hosts

| Hostname | User | System | Description |
|----------|------|--------|-------------|
| **sentinel** | `glacion` | `aarch64-darwin` | macOS environment managed via `nix-darwin` and `home-manager`. |
| **citadel** | `glacion` | `x86_64-linux` | Linux environment (WSL) managed via `home-manager`. |

## Usage

### Prerequisites
- [Nix](https://nixos.org/download.html) installed with Flakes enabled.

### Applying Configuration

**For macOS (`sentinel`):**
```bash
darwin-rebuild switch --flake .#sentinel
```

**For Home Manager (`citadel` / generic):**
```bash
home-manager switch --flake .#glacion@citadel
```
