{
  description = "LSP File Operations configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-lsp-file-operations ];
          xdg.configFile."nvim/plugin/lsp_file_operations.lua".source = ./config.lua;
        }
      );
    };
}
