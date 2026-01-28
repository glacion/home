{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.conform-nvim ];
  xdg.configFile."nvim/plugin/conform.lua".source = ./config.lua;
  home.packages = with pkgs; [
    nixfmt
  ];
}
