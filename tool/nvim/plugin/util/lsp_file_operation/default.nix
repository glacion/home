{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.lsp-file-operations-nvim ];
  xdg.configFile."nvim/plugin/lsp_file_operation.lua".source = ./config.lua;
}
