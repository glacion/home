{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };
    nix-ld = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-ld";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };
  };

  outputs =
    inputs@{
      home-manager,
      nix-darwin,
      nix-homebrew,
      nixpkgs,
      rust-overlay,
      self,
      ...
    }:
    let
      overlays = [ (import rust-overlay) ];
      modules = [
        ./development
        ./host/core
      ];
    in
    {
      homeConfigurations = {
        "glacion@citadel" = home-manager.lib.homeManagerConfiguration {
          modules = modules ++ [
            {
              home = {
                username = "glacion";
                homeDirectory = "/home/glacion";
                stateVersion = "26.05";
              };
            }
          ];
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            inherit overlays;
          };
        };
        "glacion@sentinel" = home-manager.lib.homeManagerConfiguration {
          modules = modules ++ [
            {
              home = {
                username = "glacion";
                homeDirectory = "/Users/glacion";
                stateVersion = "26.05";
              };
            }
          ];
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            inherit overlays;
          };
        };
      };

      nixosConfigurations.citadel = nixpkgs.lib.nixosSystem {
        modules = [ ./host/linux ];
        specialArgs = { inherit self inputs; };
        system = "x86_64-linux";
      };

      darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
        modules = [
          ./host/darwin
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
        ];
        specialArgs = { inherit self inputs; };
        system = "aarch64-darwin";
      };
    };
}
