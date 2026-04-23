{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/docker.lua".source = ./config.lua;
}
