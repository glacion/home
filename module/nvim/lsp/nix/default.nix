{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/nix.lua".source = ./config.lua;
}
