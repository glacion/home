{ pkgs, ... }:
{
  home.packages = with pkgs; [
    buck2
    buildifier
    just
  ];
}
