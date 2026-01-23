{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.ruff ];
  xdg.configFile."nvim/plugin/ruff.lua".source = ./ruff.lua;
  xdg.configFile."nvim/plugin/ty.lua".source = ./ty.lua;
}
