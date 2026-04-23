{ pkgs, ... }:
{
  xdg.configFile."nvim/plugin/ruby_lsp.lua".source = ./config.lua;
}
