{
  pkgs,
  nixpkgsConfig,
  nixpkgsOverlays,
  ...
}:
{
  environment.systemPackages = with pkgs; [ unzip ];
  security.sudo.wheelNeedsPassword = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs = {
    config = nixpkgsConfig;
    overlays = nixpkgsOverlays;
  };

  programs = {
    zsh.enable = true;
    nix-ld.dev = {
      enable = true;
      libraries = with pkgs; [
        icu
        openssl
        stdenv.cc.cc.lib
      ];
    };
  };

  users.users.glacion = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
