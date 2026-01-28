{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.nixd ];
  xdg.configFile."nvim/plugin/nix.lua".source = ./config.lua;
}
