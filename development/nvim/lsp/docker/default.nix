{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.dockerfile-language-server ];
  xdg.configFile."nvim/plugin/docker.lua".source = ./config.lua;
}
