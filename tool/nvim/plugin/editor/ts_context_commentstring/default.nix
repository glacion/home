{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-ts-context-commentstring ];
  xdg.configFile."nvim/plugin/ts_context_commentstring.lua".source = ./config.lua;
}
