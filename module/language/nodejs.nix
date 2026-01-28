{ pkgs, ... }:
{
  home.sessionPath = [ "$HOME/.local/share/pnpm" ];
  home.packages = with pkgs; [
    nodejs
    pnpm
    biome
  ];
}
