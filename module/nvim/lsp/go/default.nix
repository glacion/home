{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.gopls ];
  xdg.configFile."nvim/plugin/go.lua".source = ./config.lua;
}
