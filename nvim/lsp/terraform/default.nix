{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.terraform-ls ];
  xdg.configFile."nvim/plugin/terraform.lua".source = ./terraform.lua;
}
