{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.omnisharp-roslyn ];
  xdg.configFile."nvim/plugin/omnisharp.lua".source = ./config.lua;
}