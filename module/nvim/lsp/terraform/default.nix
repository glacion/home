{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/terraform.lua".source = ./config.lua;
}
