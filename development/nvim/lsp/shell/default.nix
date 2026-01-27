{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.nodePackages.bash-language-server ];
  xdg.configFile."nvim/plugin/bashls.lua".source = ./config.lua;
}
