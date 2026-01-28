{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-lsp-file-operations ];
  xdg.configFile."nvim/plugin/lsp_file_operation.lua".source = ./config.lua;
}
