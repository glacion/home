{
  inputs,
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
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;
  system.stateVersion = "25.05";

  environment = {
    variables.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
    systemPackages = [
      pkgs.nh
      pkgs.wsl-open
    ];
  };

  imports = [
    home-manager.nixosModules.home-manager
    nix-ld.nixosModules.nix-ld
    nixos-wsl.nixosModules.default
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
