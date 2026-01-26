{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.dockerfile-language-server ];
  xdg.configFile."nvim/plugin/dockerls.lua".source = ./dockerls.lua;
}
