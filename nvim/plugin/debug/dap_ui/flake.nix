{
  description = "DAP UI configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [
            pkgs.vimPlugins.nvim-dap-ui
            pkgs.vimPlugins.nvim-nio
          ];
          xdg.configFile."nvim/plugin/dap_ui.lua".source = ./config.lua;
        }
      );
    };
}
