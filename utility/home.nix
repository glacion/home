{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bandwhich
    doggo
    erdtree
    jq
    nmap
    pueue
    viddy
    yq
  ];
}
