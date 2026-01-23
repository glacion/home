{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-dap-ui ];
  xdg.configFile."nvim/plugin/dap_ui.lua".source = ./config.lua;
}
