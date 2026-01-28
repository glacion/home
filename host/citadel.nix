{
  lib,
  pkgs,
  nixpkgsConfig,
  nixpkgsOverlays,
  ...
}:
{
  networking.hostName = "citadel";

  virtualisation.docker.enable = true;
  system.stateVersion = "25.05";

  environment = {
    systemPackages = [ pkgs.wsl-open ];
    variables.LD_LIBRARY_PATH = lib.mkDefault pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs = {
    config = nixpkgsConfig;
    overlays = nixpkgsOverlays;
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
