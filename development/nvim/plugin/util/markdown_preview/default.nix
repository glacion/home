{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.markdown-preview-nvim ];
  xdg.configFile."nvim/plugin/markdown_preview.lua".source = ./config.lua;
}
