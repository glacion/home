{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-web-devicons ];
}
