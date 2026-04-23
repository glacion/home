{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/taplo.lua".source = ./config.lua;
}
