{ pkgs, ... }: {
  home.packages = with pkgs; [ go ];
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.sessionVariables = {
    GOPATH = "$HOME/.local/share/go";
    GOBIN = "$HOME/.local/bin";
  };
}
