{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.buck2 ];
  xdg.configFile."nvim/plugin/buck2.lua".source = ./buck2.lua;
}
