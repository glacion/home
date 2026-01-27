{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bandwhich
    jq
    nmap
    pueue
    viddy
    yq
  ];
}
