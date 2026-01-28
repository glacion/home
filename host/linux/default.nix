{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  nixos-wsl = inputs.nixos-wsl;
  nix-ld = inputs.nix-ld;
  home-manager = inputs.home-manager;
in
{
  networking.hostName = "citadel";

  virtualisation.docker.enable = true;
  system.stateVersion = "25.05";

  environment = {
    systemPackages = [ pkgs.wsl-open ];
    variables.LD_LIBRARY_PATH = lib.mkDefault pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
  };

  imports = [
    ../core/nix.nix
    home-manager.nixosModules.home-manager
    nix-ld.nixosModules.nix-ld
    nixos-wsl.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.glacion = {
      home = {
        username = "glacion";
        homeDirectory = "/home/glacion";
        stateVersion = "26.05";
      };
      imports = [
        ../../development
        ../core
      ];
    };
  };

  programs = {
    nix-ld.dev.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        open = "wsl-open";
      };
    };
  };

  users.users.glacion = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "docker"
      "wheel"
    ];
  };

  wsl = {
    defaultUser = "glacion";
    enable = true;
  };
}
