{ pkgs, ... }:
{
  networking.hostName = "citadel";

  virtualisation.docker.enable = true;
  system.stateVersion = "26.05";

  environment.systemPackages = with pkgs; [ wsl-open ];

  programs = {
    zsh = {
      shellAliases = {
        open = "wsl-open";
      };
    };
  };

  users.users.glacion = {
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
