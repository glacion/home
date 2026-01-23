{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-dap-virtual-text ];
  xdg.configFile."nvim/plugin/dap_virtual_text.lua".source = ./config.lua;
}
