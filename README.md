# Nix Configuration

This repository contains declarative machine and user environment configuration built with **Nix Flakes**, **NixOS**, **nix-darwin**, and **Home Manager**.

## Architecture

The flake entry point delegates host wiring to `host/`, while reusable Home Manager modules live under `module/`.

### Structure
- **`flake.nix`**: flake inputs, supported systems, and the top-level `./host` import.
- **`host/default.nix`**: central host wiring for Darwin and NixOS outputs.
- **`host/common/`**: shared host modules:
  - `home.nix` for the shared Home Manager user configuration
  - `nixos.nix` for common NixOS settings
- **`host/*.nix`**: host-specific system configuration.
- **`module/`**: shared Home Manager modules grouped by concern:
  - `core/`
  - `shell/`
  - `development/`
  - `language/`
  - `nvim/`
  - `opencode/`

## Hosts

| Hostname | User | System | Description |
|----------|------|--------|-------------|
| **sentinel** | `glacion` | `aarch64-darwin` | macOS system managed with `nix-darwin`, Home Manager, and `nix-homebrew`. |
| **citadel** | `glacion` | `x86_64-linux` | NixOS on WSL managed with Home Manager and `nix-ld`. |
| **reliquary** | `glacion` | `x86_64-linux` | NixOS host managed with shared NixOS and Home Manager modules. |
| **aegis** | `glacion` | `aarch64-linux` | ARM NixOS host managed with shared NixOS and Home Manager modules. |

## Usage

### Prerequisites
- [Nix](https://nixos.org/download.html) with flakes enabled
- [`nh`](https://github.com/viperML/nh)

### Dry build before applying

**NixOS (`citadel`, `reliquary`, `aegis`):**
```bash
nh os build
```

**macOS (`sentinel`):**
```bash
nh darwin build
```

### Apply configuration

**NixOS:**
```bash
nh os switch
```

**macOS:**
```bash
nh darwin switch
```
