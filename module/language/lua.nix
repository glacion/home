{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    stylua
    luaPackages.luacheck
    luajit
  ];
}
