{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.vtsls pkgs.biome ];
  xdg.configFile."nvim/plugin/biome.lua".source = ./biome.lua;
  xdg.configFile."nvim/plugin/vtsls.lua".source = ./vtsls.lua;
}
