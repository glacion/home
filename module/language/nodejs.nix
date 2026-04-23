{ pkgs, ... }:
{
  home.sessionPath = [ "$HOME/.local/share/pnpm" ];
  home.packages = with pkgs; [
    biome
    nodejs
    pnpm
    vtsls
  ];
}
