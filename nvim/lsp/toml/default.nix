{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.taplo ];
  xdg.configFile."nvim/plugin/taplo.lua".source = ./taplo.lua;
}
