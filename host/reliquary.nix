{
  pkgs,
  nixpkgsConfig,
  nixpkgsOverlays,
  ...
}:
{
  networking = {
    hostName = "reliquary";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 8096 ];
  };

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [ unzip ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config = nixpkgsConfig;
    overlays = nixpkgsOverlays;
  };

  services.jellyfin.enable = true;

  programs = {
    nix-ld.dev = {
      enable = true;
      libraries = with pkgs; [
        icu
        openssl
        stdenv.cc.cc.lib
      ];
    };
    zsh.enable = true;
  };

  users.users.glacion = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
