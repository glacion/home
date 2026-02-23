{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    nmap
    yq
  ];
}
