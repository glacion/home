{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/lua.lua".source = ./config.lua;
}
