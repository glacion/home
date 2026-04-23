{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ruby
    bundix
    rufo
    rubyPackages.ruby-lsp
  ];
}
