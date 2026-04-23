{ pkgs, ... }:
{
  xdg.configFile = {
    "nvim/plugin/ruff.lua".source = ./ruff.lua;
    "nvim/plugin/ty.lua".source = ./ty.lua;
  };
}
