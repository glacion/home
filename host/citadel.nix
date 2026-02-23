{
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
    systemPackages = with pkgs; [
      unzip
      wsl-open
    ];
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
    nix-ld.dev = {
      enable = true;
      libraries = with pkgs; [ icu openssl stdenv.cc.cc.lib ];
    };
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
