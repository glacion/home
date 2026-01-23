{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-dap ];
  xdg.configFile."nvim/plugin/dap.lua".source = ./config.lua;
}
