{ pkgs, ... }:
{
  home.sessionPath = [ "$HOME/.bun/bin" ];
  home.packages = with pkgs; [
    bun
    biome
  ];
}
