{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
  ];

  home.packages = with pkgs; [
    gnupg
    nh
  ];
}
