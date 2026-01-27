{ pkgs, ... }:
{
  programs.neovim.extraPackages = [
    pkgs.ruff
    pkgs.ty
  ];
  xdg.configFile = {
    "nvim/plugin/ruff.lua".source = ./ruff.lua;
    "nvim/plugin/ty.lua".source = ./ty.lua;
  };
}
