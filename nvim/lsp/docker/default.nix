{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.dockerfile-language-server-nodejs ];
  xdg.configFile."nvim/plugin/dockerls.lua".source = ./dockerls.lua;
}
