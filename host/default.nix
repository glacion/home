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

  nixpkgsConfig = {
    allowAliases = false;
    allowUnfree = true;
  };
  nixpkgsOverlays = [ rust-overlay.overlays.default ];

  mkSpecialArgs = hostname: {
    inherit
      inputs
      nixpkgsConfig
      nixpkgsOverlays
      ;
    inherit hostname;
  };

  commonNixosModules = [
    inputs.nix-ld.nixosModules.nix-ld
    home-manager.nixosModules.home-manager
    ./common/home.nix
    ./common/nixos.nix
  ];

  mkNixosHost =
    {
      hostname,
      system,
      extraModules,
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = mkSpecialArgs hostname;
      modules = commonNixosModules ++ extraModules;
    };
in
{
  flake.darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = mkSpecialArgs "sentinel";
    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
      ./common/home.nix
      ./sentinel.nix
    ];
  };

  flake.nixosConfigurations.citadel = mkNixosHost {
    hostname = "citadel";
    system = "x86_64-linux";
    extraModules = [
      nixos-wsl.nixosModules.default
      ./citadel.nix
    ];
  };

  flake.nixosConfigurations.reliquary = mkNixosHost {
    hostname = "reliquary";
    system = "x86_64-linux";
    extraModules = [
      ./reliquary.nix
    ];
  };

  flake.nixosConfigurations.aegis = mkNixosHost {
    hostname = "aegis";
    system = "aarch64-linux";
    extraModules = [
      ./aegis.nix
    ];
  };
}
