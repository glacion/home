{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bandwhich
    jq
    nmap
    opencode
    pueue
    yq
  ];
}
