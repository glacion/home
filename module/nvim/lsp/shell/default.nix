{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.bash-language-server ];
  xdg.configFile."nvim/plugin/bashls.lua".source = ./config.lua;
}
