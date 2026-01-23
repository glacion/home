{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.gopls ];
  xdg.configFile."nvim/plugin/gopls.lua".source = ./gopls.lua;
}
