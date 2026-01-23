{
  description = "Home Manager configuration for Citadel and Sentinel";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, nix-homebrew, rust-overlay, ... }:
    let
      overlays = [ (import rust-overlay) ];
      
      commonModules = [
        ./bun
        ./cloud
        ./container
        ./core
        ./dev
        ./go
        ./kubernetes
        ./nodejs
        ./nvim
        ./opencode
        ./python
        ./rust
        ./utility
        ./zsh
      ];
    in
    {
      homeConfigurations = {
        "glacion@citadel" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            inherit overlays;
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./wsl ];
        };
        "glacion@sentinel" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            inherit overlays;
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./darwin ];
        };
      };

      darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/sentinel/configuration.nix
          ./hosts/sentinel/homebrew.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            nixpkgs.overlays = overlays;
            home-manager = {
              backupFileExtension = "bak";
              users.glacion = {
                imports = commonModules ++ [ ./darwin ];
              };
            };
          }
        ];
        specialArgs = { inherit self inputs; };
      };
    };
}
