{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    neotest
    neotest-go
    neotest-python
  ];
  xdg.configFile."nvim/plugin/neotest.lua".source = ./config.lua;
}
