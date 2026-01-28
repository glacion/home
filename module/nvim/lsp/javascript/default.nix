{ pkgs, ... }:
{
  programs.neovim.extraPackages = [
    pkgs.vtsls
    pkgs.biome
  ];
  xdg.configFile = {
    "nvim/plugin/biome.lua".source = ./biome.lua;
    "nvim/plugin/vtsls.lua".source = ./vtsls.lua;
  };
}
