{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    nix-darwin
    rust-overlay
    ;

  nixpkgsConfig.allowUnfree = true;
  nixpkgsOverlays = [ rust-overlay.overlays.default ];

  userConfig =
    { pkgs, ... }:
    let
      homeDir = if pkgs.stdenv.isDarwin then "/Users/glacion" else "/home/glacion";
    in
    {
      imports = [
        ../module/core
        ../module/development
        ../module/language
        ../module/shell
        ../module/nvim
        ../module/opencode
      ];

      home = {
        username = "glacion";
        homeDirectory = homeDir;
        stateVersion = "26.05";
      };
    };
in
{
  flake.darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = {
      inherit inputs nixpkgsConfig nixpkgsOverlays;
      hostname = "sentinel";
    };
    modules = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
      ./sentinel.nix
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";
          extraSpecialArgs = {
            inherit inputs;
            hostname = "sentinel";
          };
          users.glacion = userConfig;
        };
      }
    ];
  };

  flake.nixosConfigurations.citadel = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs nixpkgsConfig nixpkgsOverlays;
      hostname = "citadel";
    };
    modules = [
      inputs.nixos-wsl.nixosModules.default
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./citadel.nix
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            hostname = "citadel";
          };
          users.glacion = userConfig;
        };
      }
    ];
  };
}
