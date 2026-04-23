{ pkgs, ... }:
{
  home.packages = with pkgs; [
    graphviz
    jq
    nmap
    yq
  ];
}
