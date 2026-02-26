{ pkgs, ... }:
{
  programs.neovim.extraPackages = [ pkgs.rubyPackages."ruby-lsp" ];
  xdg.configFile."nvim/plugin/ruby_lsp.lua".source = ./config.lua;
}
