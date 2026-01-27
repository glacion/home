{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.lua-language-server ];
  xdg.configFile."nvim/plugin/lua.lua".source = ./config.lua;
}
