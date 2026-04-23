{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/yamlls.lua".source = ./config.lua;
}
