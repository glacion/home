{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/go.lua".source = ./config.lua;
}
