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
  inherit (nixpkgs) lib;

  nixpkgsConfig.allowUnfree = true;
  nixpkgsOverlays = [ rust-overlay.overlays.default ];

  sharedHomeModules = [
    ../module/core
    ../module/development
    ../module/language
    ../module/shell
    ../module/nvim
    ../module/opencode
  ];

  userConfig =
    { pkgs, ... }:
    {
      imports = sharedHomeModules;

      home = {
        username = "glacion";
        homeDirectory = if pkgs.stdenv.isDarwin then "/Users/glacion" else "/home/glacion";
        stateVersion = "26.05";
      };
    };

  mkHomeManagerModule = hostname: backupFileExtension: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit inputs hostname;
      };
      users.glacion = userConfig;
    }
    // lib.optionalAttrs (backupFileExtension != null) {
      inherit backupFileExtension;
    };
  };

  mkHostArgs = hostname: {
    inherit
      inputs
      nixpkgsConfig
      nixpkgsOverlays
      hostname
      ;
  };
in
{
  flake.darwinConfigurations.sentinel = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = mkHostArgs "sentinel";
    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
      ./sentinel.nix
      (mkHomeManagerModule "sentinel" "bak")
    ];
  };

  flake.nixosConfigurations.citadel = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = mkHostArgs "citadel";
    modules = [
      nixos-wsl.nixosModules.default
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./citadel.nix
      (mkHomeManagerModule "citadel" null)
    ];
  };

  flake.nixosConfigurations.reliquary = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = mkHostArgs "reliquary";
    modules = [
      inputs.nix-ld.nixosModules.nix-ld
      home-manager.nixosModules.home-manager
      ./reliquary.nix
      (mkHomeManagerModule "reliquary" null)
    ];
  };
}
