{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ruby
    bundix
    rufo
  ];
}
