{
  description = "DAP core configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [
            pkgs.vimPlugins.nvim-dap
            pkgs.vimPlugins.nvim-dap-vscode-js
            pkgs.vimPlugins.nvim-dap-view
          ];
          xdg.configFile."nvim/plugin/dap.lua".source = ./config.lua;
        }
      );
    };
}
