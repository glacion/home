{ pkgs, ... }:
{
  home.packages = with pkgs; [
    buck2
    stylua
  ];
}
