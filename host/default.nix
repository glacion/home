{ inputs, ... }:
let
  inherit (inputs)
    home-manager
    nix-darwin
    nix-homebrew
    nixos-wsl
    nixpkgs
    rust-overlay
    ;

  nixpkgsConfig.allowUnfree = true;
  nixpkgsOverlays = [ rust-overlay.overlays.default ];
in
{
  flake.darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = {
      inherit
        inputs
        nixpkgsConfig
        nixpkgsOverlays
        ;
      hostname = "sentinel";
    };
    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
      ./common/home.nix
      ./sentinel.nix
    ];
  };

  flake.nixosConfigurations.citadel = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit
        inputs
        nixpkgsConfig
        nixpkgsOverlays
        ;
      hostname = "citadel";
    };
    modules = [
      nixos-wsl.nixosModules.default
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./common/home.nix
      ./common/nixos.nix
      ./citadel.nix
    ];
  };

  flake.nixosConfigurations.reliquary = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit
        inputs
        nixpkgsConfig
        nixpkgsOverlays
        ;
      hostname = "reliquary";
    };
    modules = [
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./common/home.nix
      ./common/nixos.nix
      ./reliquary.nix
    ];
  };

  flake.nixosConfigurations.aegis = nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    specialArgs = {
      inherit
        inputs
        nixpkgsConfig
        nixpkgsOverlays
        ;
      hostname = "aegis";
    };
    modules = [
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./common/home.nix
      ./common/nixos.nix
      ./aegis.nix
    ];
  };
}
