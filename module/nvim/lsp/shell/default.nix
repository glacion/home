{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/bashls.lua".source = ./config.lua;
}
