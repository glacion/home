{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go
    gopls
  ];
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.sessionVariables = {
    GOPATH = "$HOME/.local/share/go";
    GOBIN = "$HOME/.local/bin";
  };
}
