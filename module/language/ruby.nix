{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ruby
    bundix
    rubyfmt
    rufo
  ];
}
